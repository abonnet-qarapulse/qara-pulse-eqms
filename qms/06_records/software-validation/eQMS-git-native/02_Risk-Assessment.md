---
doc_id: VAL-EQMS-GIT-02
title: "Git-native eQMS Risk Assessment"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Git-native eQMS Risk Assessment

## Purpose

This document identifies and assesses risks associated with the use of the Git-native eQMS configuration for document and record control. The risk assessment informs the validation strategy and defines which functions require verification.

---

## Risk Assessment Approach

The risk assessment follows the organization's **Process Risk Management Procedure** and considers:

- **Potential failure modes** of the Git-native eQMS system
- **Impact on QMS integrity** (document control, traceability, compliance)
- **Likelihood** of occurrence without controls
- **Risk mitigation** through technical controls and validation
- **Residual risk** after controls are implemented

Risk levels guide validation intensity: high risks require comprehensive verification, low risks may require only periodic monitoring.

---

## Risk Identification and Assessment

| Risk ID | Risk Description | Potential Impact | Likelihood (before controls) | Severity | Risk Level | Mitigation/Control Measures | Residual Risk |
|---------|------------------|------------------|------------------------------|----------|------------|----------------------------|---------------|
| **R-01** | Unauthorized modification of controlled documents (bypass of approval process) | Loss of document control, non-compliant procedures used, regulatory non-conformity | Medium | High | **High** | - Branch protection rules prevent direct commits<br>- CODEOWNERS enforce approval authority<br>- Access control limits write permissions | Low |
| **R-02** | Loss of audit trail (history deletion, force push, repository corruption) | Unable to demonstrate document history, traceability failure, audit failure | Low | High | **Medium** | - Branch protection prevents force push<br>- Git architecture preserves history<br>- Backup strategy enables recovery | Low |
| **R-03** | Incorrect approval authority (wrong person approves change) | Non-compliant approval, quality decision by unauthorized person | Medium | Medium | **Medium** | - CODEOWNERS file defines approval authority<br>- Branch protection enforces required reviews<br>- Validation verifies CODEOWNERS enforcement | Low |
| **R-04** | Document metadata inconsistency (missing doc_id, version, owner) | Document identification failure, traceability gaps | Medium | Medium | **Medium** | - YAML header template standardization<br>- CI/CD quality gates validate metadata<br>- Automated checks prevent merging invalid documents | Low |
| **R-05** | Repository data loss (GitHub outage, account deletion, malicious action) | Complete loss of QMS documentation, business continuity failure | Low | Critical | **High** | - Regular backup (git clone --mirror)<br>- Backup storage in separate location<br>- Restore procedure tested | Low |
| **R-06** | Access misconfiguration (unauthorized access granted, legitimate access denied) | Confidentiality breach, inability to perform QMS duties | Medium | Medium | **Medium** | - GitHub team-based access control<br>- Regular access review<br>- Documented access control procedure | Low |
| **R-07** | CI/CD quality gate failure (gate not executed, incorrectly configured, bypassed) | Invalid documents merged, inconsistent structure | Low | Medium | **Low** | - Branch protection requires status checks<br>- CI/CD configuration under version control<br>- Periodic verification of gate execution | Low |
| **R-08** | Pull Request merge without proper review (accidental merge, insufficient review) | Change control failure, unapproved changes become effective | Low | High | **Medium** | - Branch protection requires minimum reviewers<br>- CODEOWNERS must approve<br>- PR template guides review process | Low |
| **R-09** | Platform dependency (GitHub SaaS unavailability, service discontinuation, regulatory non-compliance) | Inability to access QMS, business continuity failure | Low | Medium | **Medium** | - Supplier assessment of GitHub<br>- Backup enables migration to alternative platform<br>- Exit strategy documented | Low |
| **R-10** | Configuration drift (branch protection weakened, CODEOWNERS removed, rules bypassed) | Gradual degradation of controls, increased risk over time | Medium | Medium | **Medium** | - Configuration under version control<br>- Periodic verification during internal audit<br>- Revalidation triggered by configuration changes | Low |

---

## Risk Level Definitions

| Risk Level | Definition | Validation Approach |
|-----------|------------|---------------------|
| **High** | Unacceptable risk without mitigation; requires comprehensive validation | Formal test protocols, objective evidence, documented verification |
| **Medium** | Acceptable risk with controls; requires validation of key controls | Targeted test protocols, evidence of control effectiveness |
| **Low** | Acceptable risk; requires periodic monitoring | Monitoring during operation, periodic review |

---

## Critical Functions Requiring Validation

Based on the risk assessment, the following functions are identified as critical and require validation:

1. **Branch Protection Enforcement** (R-01, R-02, R-08)
   - Prevents unauthorized direct commits to main branch
   - Enforces Pull Request workflow
   - Prevents force push and history rewriting

2. **CODEOWNERS Approval Authority** (R-01, R-03)
   - Ensures only authorized persons approve changes
   - Maps QMS roles to approval authority
   - Enforces separation of duties

3. **Pull Request Change Control** (R-01, R-08)
   - Requires formal proposal for all changes
   - Documents rationale and impact
   - Links changes to reviews and approvals

4. **CI/CD Quality Gates** (R-04, R-07)
   - Validates document metadata
   - Checks structural consistency
   - Prevents merging of non-compliant documents

5. **Audit Trail Generation** (R-02)
   - Preserves complete history of changes
   - Records who changed what, when, and why
   - Maintains immutable record of approvals

6. **Access Control** (R-06)
   - Restricts access based on roles
   - Prevents unauthorized modifications
   - Maintains confidentiality where required

---

## Validation Strategy

The validation approach is **risk-based and proportionate**:

- **High-risk functions** undergo comprehensive testing with documented evidence
- **Medium-risk functions** undergo targeted testing of key controls
- **Low-risk functions** are monitored during operation and reviewed periodically

The validation focuses on demonstrating that:
1. Technical controls are correctly configured
2. Controls effectively prevent identified risks
3. The system fulfills its intended use under realistic conditions

---

## Acceptance Criteria

Validation is successful when:

- All critical functions are verified through test protocols
- Test protocols demonstrate control effectiveness
- No critical deviations remain unresolved
- Evidence is sufficient for audit and inspection review
- Validation summary report is approved by Quality/Regulatory

---

## Risk Review and Update

This risk assessment shall be reviewed:

- During validation execution (if new risks are identified)
- When configuration changes occur
- During periodic validation review
- Following incidents or near-misses
- As part of management review

---

## Related QMS Documents

- Process Risk Management Procedure
- Non-Product Software Application Validation Procedure
- Change Control Procedure
- Document and Record Control Procedure

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
