---
doc_id: VAL-EQMS-GIT-03
title: "Git-native eQMS Validation Plan"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Git-native eQMS Validation Plan

## Purpose

This document defines the approach, scope, responsibilities, and acceptance criteria for validation of the Git-native eQMS configuration used for document and record control.

---

## Validation Objective

To demonstrate through objective evidence that the Git-native eQMS configuration is capable of consistently fulfilling its intended use for:

- Document control (versioning, identification, status management)
- Change control (formal proposal, review, approval)
- Access control and authorization
- Audit trail generation and preservation
- Quality enforcement through technical controls

---

## Regulatory Basis

This validation is performed in accordance with:

- **ISO 13485:2016, Clause 4.1.6** — Validation of software used in the QMS
- **Non-Product Software Application Validation Procedure**
- Risk-based validation principles proportionate to intended use

---

## Scope

### In Scope

The validation covers the following system components and functions:

1. **GitHub Platform** (repository hosting, collaboration, access control)
2. **Git Version Control** (versioning, history, audit trail)
3. **GitHub Pull Requests** (change control workflow)
4. **GitHub CODEOWNERS** (approval authority enforcement)
5. **GitHub Branch Protection Rules** (technical quality enforcement)
6. **GitHub Actions** (automated quality gates)

### Out of Scope

- Product software development processes (covered separately by SDLC validation)
- Training effectiveness (covered by training records and competency assessment)
- General GitHub platform reliability (addressed through supplier assessment)

---

## Validation Approach

The validation follows a **risk-based, function-oriented** approach:

1. **Risk Assessment** — Identify risks to QMS integrity (documented in `02_Risk-Assessment.md`)
2. **Critical Functions** — Define functions that mitigate identified risks
3. **Test Protocols** — Develop test protocols for each critical function
4. **Execution** — Execute test protocols in the actual eQMS environment
5. **Evidence Collection** — Collect objective evidence (screenshots, Git history, configuration exports)
6. **Deviation Management** — Document and resolve deviations
7. **Summary Report** — Compile validation summary with pass/fail determination
8. **Approval** — Obtain formal approval through quality review

**Validation Type:** Installation Qualification (IQ) / Operational Qualification (OQ) combined approach, proportionate to the SaaS nature and risk level.

---

## Critical Functions to Validate

Based on the risk assessment, the following critical functions require validation:

| Function ID | Critical Function | Risk(s) Addressed | Test Protocol |
|------------|-------------------|-------------------|---------------|
| **CF-01** | Branch Protection Enforcement | R-01, R-02, R-08 | TP-01_Branch-Protection.md |
| **CF-02** | CODEOWNERS Approval Authority | R-01, R-03 | TP-02_CODEOWNERS.md |
| **CF-03** | Pull Request Change Control Workflow | R-01, R-08 | TP-03_Pull-Request-Control.md |
| **CF-04** | CI/CD Quality Gates Execution | R-04, R-07 | TP-04_CI-Quality-Gates.md |
| **CF-05** | Audit Trail Generation and Preservation | R-02 | TP-05_Audit-Trail.md |
| **CF-06** | Access Control and Authorization | R-06 | TP-06_Access-Control.md |

See `06_Critical-Functions-and-Controls.md` for detailed mapping of functions to technical controls.

---

## Validation Phases

### Phase 1: Planning and Preparation

**Activities:**
- Review system description and intended use
- Conduct risk assessment
- Define critical functions and acceptance criteria
- Develop test protocols
- Prepare test environment (ensure actual eQMS configuration is in operational state)

**Deliverables:**
- System Description
- Risk Assessment
- Validation Plan (this document)
- Test Protocols

**Responsible:** Quality/Regulatory

### Phase 2: Execution

**Activities:**
- Execute test protocols in sequence
- Collect objective evidence (screenshots, configuration exports, Git logs)
- Document test results in Test Execution Records
- Record deviations in Deviation Log

**Deliverables:**
- Completed Test Execution Records
- Evidence artifacts (stored in `08_Test-Protocols/evidence/` or referenced location)
- Deviation Log (if applicable)

**Responsible:** Validation Team (Quality + IT/Admin)

### Phase 3: Review and Approval

**Activities:**
- Review test results for completeness and compliance
- Assess deviations and determine impact
- Compile Validation Summary Report
- Obtain formal approval through Pull Request review and merge

**Deliverables:**
- Validation Summary Report
- Approval record (GitHub Pull Request merge)

**Responsible:** Quality/Regulatory (approval), Top Management (notification)

---

## Test Protocol Structure

Each test protocol follows a standardized structure:

1. **Objective** — What is being verified
2. **Preconditions** — Configuration state required before testing
3. **Test Steps** — Specific actions to perform
4. **Expected Results** — What constitutes successful verification
5. **Pass Criteria** — Clear pass/fail determination
6. **Evidence Requirements** — What evidence to collect

Test execution is documented using the **Test Execution Record Template** (`09_Test-Execution-Templates/Test-Execution-Record.md`).

---

## Acceptance Criteria

The Git-native eQMS validation is considered successful when:

1. **All test protocols executed** — No critical tests skipped
2. **All critical functions verified** — Pass criteria met for each critical function
3. **Deviations resolved or justified** — No unresolved critical deviations
4. **Evidence collected** — Sufficient objective evidence for audit review
5. **Traceability demonstrated** — Risk → Control → Test → Evidence linkage complete
6. **Summary report approved** — Formal approval obtained through quality review

**Overall Pass Criteria:**
- All critical test protocols (TP-01 through TP-06) achieve "Pass" status
- Any deviations are documented, resolved, or justified with risk acceptance
- Evidence demonstrates the system operates as intended under realistic conditions

---

## Deviation Management

Deviations from expected results are managed as follows:

1. **Documentation** — Record deviation in Deviation Log with description, impact, and severity
2. **Investigation** — Determine root cause and impact on validation
3. **Resolution** — Implement corrective action, retest, or accept with justification
4. **Closure** — Document resolution and obtain approval
5. **Traceability** — Link deviation to test protocol and summary report

**Severity Levels:**
- **Critical** — Function does not work; validation cannot pass without resolution
- **Major** — Function works with limitations; requires corrective action or risk acceptance
- **Minor** — Cosmetic or documentation issue; acceptable with justification

---

## Roles and Responsibilities

| Role | Responsibilities |
|------|------------------|
| **Quality/Regulatory Lead** | Overall validation ownership, plan approval, summary report approval |
| **Validation Team** | Test protocol execution, evidence collection, deviation documentation |
| **IT/Administrator** | GitHub configuration verification, access control setup, backup verification |
| **Top Management** | Review validation summary, approve validation completion (if required by org) |

---

## Validation Environment

**System Configuration:**
- GitHub repository: `[Organization's actual eQMS repository]`
- Branch protection: Configured on `main` branch
- CODEOWNERS: Defined for QMS document paths
- CI/CD: GitHub Actions workflows active
- Access control: GitHub teams and permissions configured

**Note:** Validation is performed on the **actual production eQMS environment**, not a separate test environment, as the validation verifies configuration correctness.

---

## Evidence Storage

Evidence collected during validation includes:

- Screenshots of configuration (branch protection, CODEOWNERS, CI logs)
- Git command outputs (log, diff, show)
- GitHub UI screenshots (Pull Request reviews, approvals, access control)
- Exported configuration files (where applicable)

Evidence is stored in:
- `08_Test-Protocols/evidence/` folder (local evidence artifacts), or
- Referenced in test execution records with file paths or Git commit references

---

## Approval and Effectiveness

**Validation Plan Approval:**
This validation plan is approved through Pull Request review and merge into the `main` branch.

**Validation Completion Approval:**
The Validation Summary Report is approved through Pull Request review and merge, signifying that the Git-native eQMS is validated and approved for use.

**Effective Date:**
The validation becomes effective upon merge of the Validation Summary Report.

---

## Revalidation Triggers

Revalidation is required when:

- Critical configuration changes (branch protection, CODEOWNERS, CI workflows)
- GitHub platform major updates affecting core functionality
- Repository migration or hosting infrastructure changes
- Periodic review identifies non-conformities or gaps
- Quality events indicate control failure

See `11_Revalidation-Plan.md` for detailed revalidation approach.

---

## Related QMS Documents

- Non-Product Software Application Validation Procedure
- Risk Assessment (02_Risk-Assessment.md)
- System Description (01_System-Description-and-Intended-Use.md)
- Test Protocols (08_Test-Protocols/)
- Validation Summary Report Template (10_Validation-Summary-Report-Template.md)

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
