---
doc_id: VAL-EQMS-GIT-06
title: "Critical Functions and Technical Controls"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Critical Functions and Technical Controls

## Purpose

This document maps the critical functions of the Git-native eQMS to specific technical controls and configuration elements. This mapping provides traceability from intended use and risks to the technical implementation that must be validated.

---

## Critical Function Mapping

| Function ID | Critical Function | Intended Use | Risk(s) Mitigated | Technical Control(s) | Configuration Element | Validation Method |
|------------|-------------------|--------------|-------------------|---------------------|----------------------|-------------------|
| **CF-01** | Branch Protection Enforcement | Prevent unauthorized changes to controlled documents | R-01, R-02, R-08 | GitHub Branch Protection Rules | Settings → Branches → Branch protection rule for `main` | Test Protocol TP-01 |
| **CF-02** | CODEOWNERS Approval Authority | Ensure only authorized persons approve QMS changes | R-01, R-03 | GitHub CODEOWNERS file + Branch protection required review from code owners | `.github/CODEOWNERS` file + branch protection setting | Test Protocol TP-02 |
| **CF-03** | Pull Request Change Control Workflow | Formalize change proposal, review, approval | R-01, R-08 | Pull Request workflow + Branch protection (requires PR) | Settings → Branches → "Require a pull request before merging" | Test Protocol TP-03 |
| **CF-04** | CI/CD Quality Gates Execution | Automated validation of document structure and metadata | R-04, R-07 | GitHub Actions + Branch protection (require status checks) | `.github/workflows/*.yml` + branch protection "Require status checks to pass" | Test Protocol TP-04 |
| **CF-05** | Audit Trail Generation and Preservation | Record complete history of changes and approvals | R-02 | Git version control + Branch protection (prevent force push) | Git commit history + branch protection "Require linear history" / "Do not allow force push" | Test Protocol TP-05 |
| **CF-06** | Access Control and Authorization | Restrict access based on roles and responsibilities | R-06 | GitHub repository permissions + Teams | Settings → Collaborators and teams → Team/user permissions | Test Protocol TP-06 |

---

## Detailed Function Descriptions

### CF-01: Branch Protection Enforcement

**Description:**  
Branch protection rules on the `main` branch prevent direct commits and enforce quality workflows. This is the foundation of the Git-native eQMS control structure.

**Technical Controls:**
- **Require a pull request before merging** — Prevents direct commits
- **Require approvals** — Minimum number of reviewers
- **Dismiss stale pull request approvals** — Re-approval required after new commits
- **Require review from Code Owners** — Links to CF-02
- **Require status checks to pass before merging** — Links to CF-04
- **Require conversation resolution** — Ensures feedback is addressed
- **Do not allow bypassing the above settings** — Prevents admin override (recommended)
- **Restrict who can push to matching branches** — Further restricts write access
- **Do not allow force pushes** — Protects audit trail
- **Do not allow deletions** — Protects branch from accidental deletion

**Configuration Location:** GitHub repository → Settings → Branches → Branch protection rule for `main`

**Validation Objective:** Verify branch protection rules prevent unauthorized actions.

---

### CF-02: CODEOWNERS Approval Authority

**Description:**  
The CODEOWNERS file defines who is authorized to approve changes to specific QMS documents or document categories. Combined with branch protection ("Require review from Code Owners"), this enforces approval authority.

**Technical Controls:**
- **CODEOWNERS file** — Maps file paths to authorized approvers (GitHub users or teams)
- **Branch protection setting** — "Require review from Code Owners" enforces CODEOWNERS approval

**Configuration Location:**  
- CODEOWNERS file: `.github/CODEOWNERS` (in repository root)
- Branch protection: Settings → Branches → "Require review from Code Owners"

**Example CODEOWNERS Patterns:**
```
# Quality Manual and Policies - Top Management approval
/qms/01_governance/ @org/top-management

# Procedures - Quality/Regulatory approval
/qms/03_procedures/ @org/quality-regulatory

# Default - any authorized QMS role
* @org/qms-approvers
```

**Validation Objective:** Verify CODEOWNERS correctly enforces approval authority, and non-authorized users cannot approve.

---

### CF-03: Pull Request Change Control Workflow

**Description:**  
All changes to controlled documents must be proposed through a Pull Request. The PR serves as the change control record, documenting the proposed change, rationale, review discussion, and approval.

**Technical Controls:**
- **Branch protection: Require a pull request before merging** — Prevents direct commits
- **Pull Request template** — Guides authors to provide rationale and impact analysis (`.github/pull_request_template.md`)
- **Required reviewers** — Minimum number of approvals (configured in branch protection)
- **Review process** — Reviewers use GitHub review mechanism (Approve, Request Changes, Comment)

**Workflow:**
1. Author creates feature branch
2. Author makes changes to QMS documents
3. Author opens Pull Request to `main`
4. Reviewers review proposed changes
5. CI/CD quality gates execute (links to CF-04)
6. CODEOWNERS must approve (links to CF-02)
7. PR merged → change becomes effective

**Configuration Location:**
- Branch protection: Settings → Branches → "Require a pull request before merging"
- Required reviewers: Settings → Branches → "Require approvals" (minimum N)

**Validation Objective:** Verify direct commits are prevented, and changes can only be merged through PR workflow with required approvals.

---

### CF-04: CI/CD Quality Gates Execution

**Description:**  
Automated quality gates execute on every Pull Request to validate document structure, metadata consistency, and QMS-specific rules before allowing merge.

**Technical Controls:**
- **GitHub Actions workflows** — CI/CD automation (`.github/workflows/*.yml`)
- **Branch protection: Require status checks to pass** — PR cannot be merged if CI fails

**Example Quality Gates:**
- Validate YAML metadata headers (doc_id, title, version, owner, status)
- Check document structure consistency
- Verify indexes are up-to-date
- Lint Markdown formatting
- [Other organization-specific checks]

**Configuration Location:**
- GitHub Actions: `.github/workflows/*.yml`
- Branch protection: Settings → Branches → "Require status checks to pass before merging"

**Validation Objective:** Verify CI/CD gates execute on PR, and PR cannot be merged if checks fail.

---

### CF-05: Audit Trail Generation and Preservation

**Description:**  
Git version control automatically generates a complete, immutable audit trail of all changes. Each commit records who changed what, when, and why. Branch protection prevents history modification.

**Technical Controls:**
- **Git commit history** — Every change recorded as commit (author, timestamp, message)
- **Pull Request history** — Review discussions, approvals, merge records preserved
- **Branch protection: Do not allow force pushes** — Prevents rewriting history
- **Branch protection: Require linear history** (optional) — Prevents complex merge graphs, simplifies audit trail

**Audit Trail Elements:**
- **Author:** Git commit author (mapped to organization identity)
- **Timestamp:** Git commit timestamp (ISO 8601 format, cryptographically signed)
- **Change description:** Git commit message + Pull Request description
- **Approval:** GitHub review approval (reviewer, timestamp, approval status)
- **Rationale:** Pull Request description and discussion

**Configuration Location:**
- Git: Inherent to version control system
- Branch protection: Settings → Branches → "Do not allow force pushes"

**Validation Objective:** Verify audit trail is generated for changes, and history cannot be modified or deleted.

---

### CF-06: Access Control and Authorization

**Description:**  
GitHub repository permissions control who can read, write, and administer the eQMS repository. Team-based access control enables role-based authorization.

**Technical Controls:**
- **Repository visibility** — Private repository (recommended for QMS)
- **Collaborators and teams** — GitHub users assigned to teams with defined permissions
- **Permission levels:**
  - **Read** — View documents and history (auditors, general staff)
  - **Write** — Create branches, open PRs (document authors, reviewers)
  - **Maintain** — Manage some settings (QMS coordinators)
  - **Admin** — Full control (QMS administrator, IT)
- **Two-factor authentication (2FA)** — Required for all users (organization policy)

**Configuration Location:**
- Repository permissions: Settings → Collaborators and teams
- Organization 2FA policy: Organization settings → Authentication security

**Validation Objective:** Verify access control is correctly configured, unauthorized users cannot access repository, and authorized users have appropriate permissions.

---

## Configuration Management

**Critical Configuration Elements:**

All critical configuration elements must be:
1. **Documented** — Configuration settings recorded (screenshots, exports, or version-controlled files where possible)
2. **Version-controlled** — Where applicable (CODEOWNERS, GitHub Actions workflows, PR templates)
3. **Change-controlled** — Changes to configuration require change control (documented, reviewed, revalidation assessment)
4. **Verified** — Validation test protocols verify configuration is correct and effective

**Configuration Files in Repository (version-controlled):**
- `.github/CODEOWNERS` — Approval authority definition
- `.github/workflows/*.yml` — CI/CD quality gates
- `.github/pull_request_template.md` — PR guidance

**Configuration in GitHub Settings (not version-controlled):**
- Branch protection rules — Must be documented (screenshots or exports) and verified during validation
- Repository access control — Must be documented and verified during validation

**Configuration Drift Prevention:**
- Periodic verification during internal audits
- Revalidation triggered when configuration changes
- Configuration backup (export settings, screenshots)

---

## Traceability to Test Protocols

Each critical function is verified through a dedicated test protocol:

| Function ID | Critical Function | Test Protocol |
|------------|-------------------|---------------|
| CF-01 | Branch Protection Enforcement | TP-01_Branch-Protection.md |
| CF-02 | CODEOWNERS Approval Authority | TP-02_CODEOWNERS.md |
| CF-03 | Pull Request Change Control Workflow | TP-03_Pull-Request-Control.md |
| CF-04 | CI/CD Quality Gates Execution | TP-04_CI-Quality-Gates.md |
| CF-05 | Audit Trail Generation and Preservation | TP-05_Audit-Trail.md |
| CF-06 | Access Control and Authorization | TP-06_Access-Control.md |

See `07_Traceability-Matrix.md` for complete risk → control → test traceability.

---

## Related QMS Documents

- Risk Assessment (02_Risk-Assessment.md)
- Validation Plan (03_Validation-Plan.md)
- Traceability Matrix (07_Traceability-Matrix.md)
- Test Protocols (08_Test-Protocols/)

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
