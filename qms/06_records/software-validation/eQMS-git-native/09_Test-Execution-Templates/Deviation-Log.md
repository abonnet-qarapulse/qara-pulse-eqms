---
doc_id: VAL-EQMS-GIT-DEV
title: "Validation Deviation Log"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Validation Deviation Log

## Purpose

This document records all deviations identified during execution of the Git-native eQMS validation test protocols. Deviations are any instances where test results differ from expected behavior or where test execution departs from the planned protocol.

---

## Deviation Management Process

1. **Identification** — Deviation is identified during test execution
2. **Documentation** — Deviation is recorded in this log with details
3. **Investigation** — Root cause analysis and impact assessment
4. **Resolution** — Corrective action, retest, or risk acceptance with justification
5. **Closure** — Deviation resolution approved and documented
6. **Traceability** — Deviation linked to test protocol, test step, and validation summary

---

## Deviation Severity Classification

| Severity | Definition | Impact on Validation |
|----------|------------|---------------------|
| **Critical** | Function does not work as intended; system cannot fulfill critical requirement | Validation cannot pass without resolution; requires corrective action and retest |
| **Major** | Function works with limitations; partial non-conformance to requirement | Requires corrective action or documented risk acceptance; may require retest |
| **Minor** | Cosmetic, documentation, or non-critical issue; does not impact core functionality | Can be accepted with justification; corrective action optional |

---

## Deviation Log

| Deviation ID | Date Identified | Test Protocol | Test Step | Description | Severity | Root Cause | Impact Assessment | Resolution | Resolution Date | Status | Approver |
|--------------|----------------|---------------|-----------|-------------|----------|------------|-------------------|------------|-----------------|--------|----------|
| DEV-001 | [YYYY-MM-DD] | [TP-XX] | [Step X] | [Brief description of deviation] | [Critical/Major/Minor] | [Root cause analysis] | [Impact on validation and QMS operations] | [Corrective action taken or acceptance justification] | [YYYY-MM-DD] | [Open/Resolved/Accepted] | [Name] |
| DEV-002 | | | | | | | | | | | |
| DEV-003 | | | | | | | | | | | |

---

## Deviation Detail Records

### Deviation DEV-001: [Short Title]

**Deviation ID:** DEV-001  
**Date Identified:** [YYYY-MM-DD]  
**Identified By:** [Name, Role]

**Test Protocol:** [TP-XX: Test Protocol Title]  
**Test Step:** [Step X: Step Title]

**Description:**
[Detailed description of what was observed that deviated from expected results or planned protocol]

**Severity:** [Critical / Major / Minor]

**Expected Behavior:**
[What was supposed to happen according to test protocol]

**Actual Behavior:**
[What actually happened during test execution]

**Root Cause Analysis:**
[Investigation findings: why did the deviation occur?]
- Configuration issue
- User error
- Misunderstanding of requirement
- Tool limitation
- Other: [specify]

**Impact Assessment:**
[Analysis of impact on:]
- Validation completion: [Can validation proceed? Is retest required?]
- QMS operations: [Does this affect actual QMS use?]
- Risk to QMS integrity: [Does this increase risk to document control, traceability, etc.?]
- Regulatory compliance: [Does this impact compliance with ISO 13485 or regulations?]

**Proposed Resolution:**
- [ ] **Corrective Action:** [Describe specific corrective action to be taken]
- [ ] **Retest Required:** [Yes / No - specify which test steps]
- [ ] **Risk Acceptance:** [Justification for accepting deviation without corrective action]
- [ ] **Documentation Update:** [Update test protocol, validation plan, or other docs]
- [ ] **Configuration Change:** [Change system configuration to resolve issue]

**Resolution Actions Taken:**
[Document specific actions implemented]
1. [Action 1]
2. [Action 2]
3. [Retest performed on [date] - results: [Pass/Fail]]

**Resolution Date:** [YYYY-MM-DD]

**Resolution Approved By:**
- Name: [Name]
- Role: [Quality/Regulatory]
- Date: [Date]
- Approval: [Documented via PR approval or signature]

**Deviation Status:** [Open / Resolved / Accepted]

**Traceability:**
- Test Execution Record: [Link to test execution record]
- Evidence: [Reference to evidence files]
- Related Deviations: [Reference to related deviations, if any]

---

### Deviation DEV-002: [Short Title]

[Repeat structure for each deviation]

---

## Deviation Summary

| Status | Count | Notes |
|--------|-------|-------|
| **Open** | [X] | Deviations requiring action |
| **Resolved** | [X] | Deviations with completed corrective action |
| **Accepted** | [X] | Deviations accepted with justification (no corrective action) |
| **Total** | [X] | Total deviations identified |

**By Severity:**
- Critical: [X]
- Major: [X]
- Minor: [X]

---

## Impact on Validation Completion

**Critical Deviations Impact:**
[Describe any critical deviations and their impact on overall validation status]

**Validation Pass Criteria Assessment:**
- [ ] All critical deviations resolved
- [ ] All major deviations resolved or accepted with justification
- [ ] Minor deviations documented; corrective action optional
- [ ] Validation can proceed to completion

**Overall Deviation Impact:** [No impact / Minor impact / Significant impact requiring action]

---

## Approval

**Deviation Log Reviewed By:**
- Name: [Name]
- Role: [Quality/Regulatory Lead]
- Date: [Date]
- Review Comments: [Any overall comments on deviations and their management]

**Deviation Log Approved By:**
- Name: [Name]
- Role: [Quality/Regulatory Lead]
- Date: [Date]
- Approval Status: [Approved / Pending]

---

## Related Documents

- Test Protocols: `08_Test-Protocols/`
- Test Execution Records: `09_Test-Execution-Templates/Test-Execution-Record.md`
- Validation Summary Report: `10_Validation-Summary-Report-Template.md`
- Non-Product Software Application Validation Procedure

---

## Notes

- This log should be updated in real-time as deviations are identified during test execution
- Each deviation must be reviewed and approved for closure before validation can be completed
- Critical and major deviations require documented resolution or risk acceptance justification
- Minor deviations should be documented but may not block validation completion

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
