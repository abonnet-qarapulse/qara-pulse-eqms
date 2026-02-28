---
doc_id: VAL-EQMS-GIT-11
title: "Revalidation Plan"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Revalidation Plan

## Purpose

This document defines the approach for revalidation of the Git-native eQMS configuration. Revalidation ensures that the system continues to fulfill its intended use after changes to configuration, infrastructure, or when periodic review indicates the need to re-verify controls.

---

## Regulatory Basis

**ISO 13485:2016 Requirements:**
- **Clause 4.1.6** — Software validation and revalidation when changes affect intended use or performance
- **Clause 7.5.6** — Validation of processes for production and service provision, including revalidation

**Organization's QMS Requirements:**
- Non-Product Software Application Validation Procedure — Revalidation triggers and approach
- Change Control Procedure — Assessment of changes requiring revalidation

---

## Revalidation Principles

1. **Risk-based approach:** Revalidation scope is determined by the nature and impact of changes
2. **Proportionate response:** Minor changes may require only targeted verification; major changes may require full revalidation
3. **Change-triggered:** Revalidation is triggered by specific events, not calendar-based
4. **Documented assessment:** All change assessments and revalidation decisions are documented

---

## Revalidation Triggers

### Mandatory Revalidation Triggers

The following events **require** revalidation assessment and potential revalidation execution:

| Trigger Category | Specific Trigger Events | Typical Revalidation Scope |
|-----------------|------------------------|---------------------------|
| **Configuration Changes** | Changes to branch protection rules on `main` branch | Full or partial revalidation of affected controls (likely TP-01, TP-03) |
| **Configuration Changes** | Modifications to CODEOWNERS file (approval authority changes) | Revalidation of CODEOWNERS enforcement (TP-02) |
| **Configuration Changes** | Changes to CI/CD workflows (GitHub Actions quality gates) | Revalidation of quality gates (TP-04) |
| **Configuration Changes** | Changes to repository access control (team permissions) | Revalidation of access control (TP-06) |
| **Infrastructure Changes** | Migration to different GitHub organization or repository | Full revalidation (all test protocols) |
| **Infrastructure Changes** | Change in GitHub plan (e.g., Free to Enterprise, GitHub.com to GitHub Enterprise Server) | Partial revalidation (verify affected functions) |
| **Platform Updates** | Major GitHub platform updates affecting core features (branch protection, PR workflow, Actions) | Targeted revalidation based on impact assessment |
| **Quality Events** | Incident indicating control failure (e.g., unauthorized change merged, audit trail lost) | Root cause investigation + revalidation of affected controls |
| **Audit Findings** | Internal or external audit identifies validation gaps or non-conformities | Corrective action + revalidation to demonstrate effectiveness |

### Periodic Review Triggers

| Review Type | Frequency | Purpose | Action |
|------------|-----------|---------|--------|
| **Validation Status Review** | Annual | Review validation status, assess need for revalidation based on cumulative minor changes | Decision: Continue validation / Trigger revalidation |
| **Configuration Verification** | Quarterly (recommended) | Verify critical configuration (branch protection, CODEOWNERS, CI) remains as validated | Documentation of verification; revalidation if drift detected |
| **Backup Verification** | Monthly (recommended) | Verify backup execution and test restore | Update backup verification record; revalidation if backup failure |

---

## Revalidation Decision Process

### Step 1: Change Assessment

When a revalidation trigger event occurs:

1. **Document the change:**
   - What changed (configuration, infrastructure, platform)
   - When the change occurred
   - Who approved the change
   - Rationale for the change

2. **Assess impact on validated functions:**
   - Does the change affect critical functions (CF-01 through CF-06)?
   - Does the change impact risk mitigation?
   - Does the change affect intended use?

3. **Determine revalidation scope:**
   - **No revalidation required:** Change does not affect validated functions or risks (document justification)
   - **Targeted revalidation:** Specific test protocol(s) must be re-executed
   - **Full revalidation:** Complete validation must be repeated

### Step 2: Revalidation Planning

If revalidation is required:

1. **Define scope:**
   - Which test protocols must be re-executed
   - Which validation documents must be updated (risk assessment, system description, etc.)

2. **Resource planning:**
   - Assign revalidation team
   - Schedule revalidation activities

3. **Approval:**
   - Revalidation plan approved by Quality/Regulatory

### Step 3: Revalidation Execution

1. **Update validation documentation** (if needed):
   - Update System Description if intended use or architecture changed
   - Update Risk Assessment if new risks identified
   - Update test protocols if procedures changed

2. **Execute test protocols:**
   - Re-run identified test protocols
   - Collect objective evidence
   - Document results in Test Execution Records

3. **Manage deviations:**
   - Document deviations in Deviation Log
   - Resolve or accept deviations

### Step 4: Revalidation Summary and Approval

1. **Compile revalidation summary:**
   - Scope of revalidation
   - Test results
   - Deviations and resolutions
   - Validation status (revalidated / conditionally revalidated)

2. **Approval:**
   - Revalidation summary approved through Pull Request review and merge
   - Effective date = merge date

---

## Revalidation Scope Matrix

| Change Type | Example | Revalidation Scope | Test Protocols to Re-execute |
|------------|---------|-------------------|----------------------------|
| **Branch protection - minor adjustment** | Change required approvals from 1 to 2 | Targeted | TP-01 (Branch Protection), TP-03 (PR Control) |
| **Branch protection - significant change** | Remove "Require PR" setting | Full | All test protocols (validates overall system integrity) |
| **CODEOWNERS - path mapping change** | Add new team as approver for specific path | Targeted | TP-02 (CODEOWNERS) |
| **CODEOWNERS - removal** | Delete CODEOWNERS file | Full | All test protocols (major control removal) |
| **CI/CD workflow - minor update** | Update workflow script or checks | Targeted | TP-04 (CI Quality Gates) |
| **CI/CD workflow - removal** | Remove quality gate workflow | Full revalidation or risk acceptance | TP-04 + risk assessment update |
| **Access control - team membership** | Add/remove users from teams | Documentation update | No revalidation required (document access change) |
| **Access control - permission level change** | Change team from Read to Write | Targeted | TP-06 (Access Control) |
| **Repository migration** | Move to new GitHub organization | Full | All test protocols |
| **GitHub plan change** | Upgrade from Free to Enterprise | Targeted | Verify affected features (likely TP-02, TP-04, TP-06) |
| **Platform update - minor** | GitHub UI changes, no functional impact | Assessment only | No revalidation if functionality unchanged |
| **Platform update - major** | GitHub changes PR approval mechanism | Targeted to full | Assess impact; likely TP-03, TP-02 |

---

## Change Assessment Template

Use the following template to assess changes and determine revalidation need:

```markdown
## Change Assessment for Revalidation

**Change Description:**
[What changed]

**Change Date:** [YYYY-MM-DD]  
**Change Approved By:** [Name, Role]  
**Change Control Reference:** [PR number or change control record]

**Impact on Critical Functions:**
- CF-01 (Branch Protection): [Affected / Not Affected]
- CF-02 (CODEOWNERS): [Affected / Not Affected]
- CF-03 (PR Control): [Affected / Not Affected]
- CF-04 (CI/CD Quality Gates): [Affected / Not Affected]
- CF-05 (Audit Trail): [Affected / Not Affected]
- CF-06 (Access Control): [Affected / Not Affected]

**Impact on Risk Mitigation:**
[Does change affect ability to mitigate identified risks?]

**Impact on Intended Use:**
[Does change affect system's intended use for document control?]

**Revalidation Decision:**
- [ ] No revalidation required (justification: [explain])
- [ ] Targeted revalidation required (scope: [list test protocols])
- [ ] Full revalidation required (reason: [explain])

**Justification:**
[Document rationale for revalidation decision]

**Assessed By:**
- Name: [Name]
- Role: [Quality/Regulatory]
- Date: [Date]

**Approved By:**
- Name: [Name]
- Role: [Quality/Regulatory Lead]
- Date: [Date]
```

---

## Revalidation Execution Record

When revalidation is executed, document using the following structure:

```markdown
## Revalidation Execution Record

**Revalidation ID:** REV-[YYYY]-[Number]  
**Trigger Event:** [Change or trigger that initiated revalidation]  
**Revalidation Date:** [YYYY-MM-DD]

**Revalidation Scope:**
- Test Protocols Re-executed: [List]
- Validation Documents Updated: [List]

**Revalidation Results:**
- Test Protocol TP-XX: [PASS / FAIL]
- Test Protocol TP-XX: [PASS / FAIL]

**Deviations:** [Reference Deviation Log or state "None"]

**Revalidation Conclusion:**
[System remains validated / System conditionally validated / System not validated]

**Approved By:**
- Name: [Name]
- Role: [Quality/Regulatory Lead]
- Date: [Date]
- Approval: [PR merge reference]

**Effective Date:** [Merge date]
```

---

## Configuration Drift Prevention

To minimize the need for revalidation, the organization should:

1. **Version-control configuration where possible:**
   - CODEOWNERS file (already version-controlled)
   - GitHub Actions workflows (already version-controlled)
   - PR template (already version-controlled)

2. **Document non-version-controlled configuration:**
   - Export or screenshot branch protection settings
   - Export or screenshot access control settings
   - Store in `evidence/` folder or reference location

3. **Monitor configuration:**
   - Periodic verification during internal audits
   - Alert on changes to critical configuration
   - Include configuration review in management review

4. **Change control:**
   - All configuration changes require change control (PR with rationale)
   - Change control includes revalidation assessment
   - Changes approved by Quality/Regulatory

---

## Periodic Review Process

### Annual Validation Status Review

**Objective:** Assess cumulative impact of changes and determine if revalidation is needed.

**Activities:**
1. Review all changes made to Git-native eQMS configuration in past year
2. Review any minor configuration changes that did not trigger revalidation
3. Review quality events or incidents related to document control
4. Review internal and external audit findings
5. Assess whether cumulative changes warrant revalidation

**Decision:**
- Continue validation (no revalidation needed)
- Schedule targeted revalidation
- Schedule full revalidation

**Documentation:**
- Annual review documented in management review or validation record
- Decision and rationale documented

**Responsible:** Quality/Regulatory Lead

---

### Quarterly Configuration Verification

**Objective:** Verify critical configuration remains as validated.

**Activities:**
1. Verify branch protection settings on `main` branch (screenshot or export)
2. Verify CODEOWNERS file is current and accurate
3. Verify CI/CD workflows are operational (review recent workflow runs)
4. Verify access control settings (review teams and permissions)

**Documentation:**
- Verification checklist with date and verifier
- Screenshot or export of critical configuration
- Any discrepancies documented and assessed for revalidation need

**Responsible:** QMS Administrator or Quality Coordinator

---

## Revalidation Records

All revalidation activities are documented and maintained as validation records:

- **Change Assessment Records:** Assessments determining revalidation need
- **Revalidation Plans:** Plans for targeted or full revalidation
- **Test Execution Records:** Results of re-executed test protocols
- **Revalidation Summaries:** Summary of revalidation outcome and approval
- **Configuration Verification Records:** Periodic verification logs

**Storage:** `qms/06_records/software-validation/eQMS-git-native/revalidation/` (create subfolder as needed)

---

## Responsibility Matrix

| Activity | Responsible | Accountable | Consulted | Informed |
|----------|------------|-------------|-----------|----------|
| **Change assessment for revalidation** | Quality Coordinator | Quality/Regulatory Lead | Change initiator | Top Management (if major) |
| **Revalidation plan approval** | Quality/Regulatory Lead | Quality/Regulatory Lead | Validation team | Top Management (if major) |
| **Revalidation execution** | Validation team | Quality/Regulatory Lead | IT/Admin | - |
| **Revalidation approval** | Quality/Regulatory Lead | Quality/Regulatory Lead | - | Top Management |
| **Periodic configuration verification** | QMS Administrator | Quality/Regulatory Lead | - | - |
| **Annual validation status review** | Quality/Regulatory Lead | Top Management | Quality team | Organization |

---

## Related QMS Documents

- Non-Product Software Application Validation Procedure
- Change Control Procedure
- Configuration Management Procedure
- Validation Summary Report (10_Validation-Summary-Report-Template.md)
- Risk Assessment (02_Risk-Assessment.md)

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
