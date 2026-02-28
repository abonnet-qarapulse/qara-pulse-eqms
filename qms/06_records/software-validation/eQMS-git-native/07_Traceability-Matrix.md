---
doc_id: VAL-EQMS-GIT-07
title: "Validation Traceability Matrix"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Validation Traceability Matrix

## Purpose

This traceability matrix provides end-to-end traceability from identified risks through mitigation controls to validation test protocols. It demonstrates that all critical risks are addressed by technical controls and that all controls are verified through testing.

---

## Traceability Structure

```
Risk → Critical Function → Technical Control → Test Protocol → Test Evidence
```

This ensures:
- All risks are mitigated by controls
- All controls are validated through testing
- All tests produce objective evidence
- Complete traceability for audit and inspection

---

## Complete Traceability Matrix

| Risk ID | Risk Description | Severity | Critical Function ID | Critical Function | Technical Control | Configuration Element | Test Protocol | Test Status | Evidence Reference |
|---------|------------------|----------|---------------------|-------------------|-------------------|----------------------|---------------|-------------|-------------------|
| **R-01** | Unauthorized modification of controlled documents | High | CF-01 | Branch Protection Enforcement | GitHub Branch Protection Rules | Branch protection on `main` | TP-01 | [TBD] | [TBD] |
| **R-01** | Unauthorized modification of controlled documents | High | CF-02 | CODEOWNERS Approval Authority | CODEOWNERS + required review | `.github/CODEOWNERS` + branch protection | TP-02 | [TBD] | [TBD] |
| **R-01** | Unauthorized modification of controlled documents | High | CF-03 | Pull Request Change Control | PR workflow + branch protection | "Require PR before merging" | TP-03 | [TBD] | [TBD] |
| **R-02** | Loss of audit trail | High | CF-01 | Branch Protection Enforcement | Prevent force push | "Do not allow force pushes" | TP-01 | [TBD] | [TBD] |
| **R-02** | Loss of audit trail | High | CF-05 | Audit Trail Generation | Git version control + history protection | Git commit history + branch protection | TP-05 | [TBD] | [TBD] |
| **R-03** | Incorrect approval authority | Medium | CF-02 | CODEOWNERS Approval Authority | CODEOWNERS enforcement | `.github/CODEOWNERS` + branch protection | TP-02 | [TBD] | [TBD] |
| **R-04** | Document metadata inconsistency | Medium | CF-04 | CI/CD Quality Gates | GitHub Actions + required status checks | `.github/workflows/*.yml` + branch protection | TP-04 | [TBD] | [TBD] |
| **R-05** | Repository data loss | Critical | N/A (Non-technical control) | Backup and Restore | Backup strategy | Mirror backup + restore procedure | Manual verification / backup test | [TBD] | [TBD] |
| **R-06** | Access misconfiguration | Medium | CF-06 | Access Control | GitHub permissions + teams | Repository collaborators and teams | TP-06 | [TBD] | [TBD] |
| **R-07** | CI/CD quality gate failure | Medium | CF-04 | CI/CD Quality Gates | GitHub Actions + required status checks | `.github/workflows/*.yml` + branch protection | TP-04 | [TBD] | [TBD] |
| **R-08** | PR merge without proper review | High | CF-01 | Branch Protection Enforcement | Required reviewers | "Require approvals" (minimum N) | TP-01 | [TBD] | [TBD] |
| **R-08** | PR merge without proper review | High | CF-03 | Pull Request Change Control | PR workflow + required approvals | PR workflow + branch protection | TP-03 | [TBD] | [TBD] |
| **R-09** | Platform dependency | Medium | N/A (Supplier control) | Supplier Assessment + Backup | Supplier evaluation + backup strategy | GitHub supplier assessment + backup | Supplier assessment review + backup test | [TBD] | [TBD] |
| **R-10** | Configuration drift | Medium | N/A (Operational control) | Periodic Verification | Internal audit + revalidation | Configuration review during audit | Audit verification + revalidation plan | [TBD] | [TBD] |

---

## Test Protocol Coverage Summary

| Test Protocol | Critical Function(s) Verified | Risk(s) Addressed | Test Status | Pass/Fail |
|---------------|------------------------------|-------------------|-------------|-----------|
| **TP-01** | CF-01: Branch Protection Enforcement | R-01, R-02, R-08 | [TBD] | [TBD] |
| **TP-02** | CF-02: CODEOWNERS Approval Authority | R-01, R-03 | [TBD] | [TBD] |
| **TP-03** | CF-03: Pull Request Change Control | R-01, R-08 | [TBD] | [TBD] |
| **TP-04** | CF-04: CI/CD Quality Gates | R-04, R-07 | [TBD] | [TBD] |
| **TP-05** | CF-05: Audit Trail Generation | R-02 | [TBD] | [TBD] |
| **TP-06** | CF-06: Access Control | R-06 | [TBD] | [TBD] |
| **Backup Test** | Backup and Restore | R-05 | [TBD] | [TBD] |
| **Supplier Assessment** | GitHub Supplier Evaluation | R-09 | [TBD] | [TBD] |

---

## Risk Coverage Analysis

| Risk Level | Number of Risks | Mitigated by Technical Controls | Mitigated by Operational Controls | Total Mitigation Coverage |
|-----------|----------------|--------------------------------|----------------------------------|--------------------------|
| **Critical** | 1 | 0 | 1 (Backup) | 100% |
| **High** | 3 | 3 (Branch protection, CODEOWNERS, PR workflow) | 0 | 100% |
| **Medium** | 6 | 4 (CI/CD, Access control) | 2 (Supplier assessment, periodic review) | 100% |
| **Total** | 10 | 7 | 3 | 100% |

**Analysis:** All identified risks are addressed by controls (technical or operational). All technical controls are verified through test protocols.

---

## Requirements Traceability

### ISO 13485:2016 Traceability

| ISO 13485:2016 Requirement | Description | Addressed By | Verified By |
|---------------------------|-------------|--------------|-------------|
| **4.1.6** | Software validation | Complete validation dossier | All test protocols |
| **4.2.4** | Control of records | Document storage + backup + audit trail | TP-05, Backup test |
| **4.2.5** | Control of documents | Version control + change control + approval | TP-01, TP-02, TP-03 |
| **7.5.6** | Validation of processes | Validation approach and evidence | Validation plan + test execution |

### QMS Procedure Traceability

| QMS Procedure | Requirement | Addressed By | Verified By |
|--------------|-------------|--------------|-------------|
| **Document and Record Control** | Version control, approval, access control | Git + PR + CODEOWNERS + Access control | TP-01, TP-02, TP-03, TP-06 |
| **Change Control** | Formal change proposal, review, approval | Pull Request workflow | TP-03 |
| **Non-Product Software Validation** | Software validation for QMS software | This validation dossier | All test protocols |

---

## Validation Completeness Checklist

| Validation Element | Status | Reference |
|-------------------|--------|-----------|
| [ ] System description and intended use documented | [TBD] | 01_System-Description-and-Intended-Use.md |
| [ ] Risk assessment completed | [TBD] | 02_Risk-Assessment.md |
| [ ] Validation plan approved | [TBD] | 03_Validation-Plan.md |
| [ ] Supplier assessment completed | [TBD] | 04_Supplier-Assessment-GitHub.md |
| [ ] Backup strategy documented and tested | [TBD] | 05_Backup-and-Continuity-Strategy.md |
| [ ] Critical functions defined | [TBD] | 06_Critical-Functions-and-Controls.md |
| [ ] Traceability matrix complete | [TBD] | 07_Traceability-Matrix.md |
| [ ] Test protocols developed | [TBD] | 08_Test-Protocols/ |
| [ ] Test protocols executed | [TBD] | Test execution records |
| [ ] All tests passed or deviations resolved | [TBD] | Deviation log |
| [ ] Validation summary report completed | [TBD] | 10_Validation-Summary-Report-Template.md |
| [ ] Validation approved | [TBD] | Approval record (PR merge) |

---

## Evidence Requirements

For each test protocol, the following evidence should be collected:

| Test Protocol | Required Evidence |
|---------------|------------------|
| **TP-01** | Screenshots of branch protection settings; Git command outputs demonstrating prevention of direct commit and force push |
| **TP-02** | Screenshot of CODEOWNERS file; PR demonstrating CODEOWNERS approval requirement; test showing non-CODEOWNER cannot approve |
| **TP-03** | PR lifecycle demonstration (create, review, approve, merge); screenshot showing direct commit is blocked |
| **TP-04** | GitHub Actions workflow execution logs; PR showing failed status check prevents merge; PR showing passed check allows merge |
| **TP-05** | Git log outputs showing commit history; demonstration that force push is blocked; PR showing review/approval records preserved |
| **TP-06** | Screenshot of repository access settings; test showing unauthorized user cannot access; test showing authorized user has correct permissions |
| **Backup Test** | Backup execution log; restore test log; verification that restored repository is complete and functional |
| **Supplier Assessment** | GitHub ISO 27001 certificate (if available); SOC 2 report (if available); DPA documentation |

---

## Traceability Updates

This traceability matrix shall be updated:

- **During validation execution** — As tests are completed, update Test Status and Evidence Reference
- **When validation is complete** — Update Pass/Fail status and final evidence references
- **During revalidation** — Update to reflect configuration changes and new test results
- **When risks change** — Update risk assessment and corresponding controls/tests

---

## Related QMS Documents

- Risk Assessment (02_Risk-Assessment.md)
- Validation Plan (03_Validation-Plan.md)
- Critical Functions and Controls (06_Critical-Functions-and-Controls.md)
- Test Protocols (08_Test-Protocols/)
- Validation Summary Report (10_Validation-Summary-Report-Template.md)

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
