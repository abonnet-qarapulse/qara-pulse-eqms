---
doc_id: VAL-EQMS-GIT-TE-XX
title: "Test Execution Record - [Test Protocol ID]"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Test Execution Record

## Test Protocol Information

| Attribute | Value |
|-----------|-------|
| **Test Protocol ID** | [e.g., TP-01, TP-02, etc.] |
| **Test Protocol Title** | [e.g., Branch Protection Enforcement] |
| **Test Objective** | [Brief description] |
| **Test Execution Date** | [YYYY-MM-DD] |
| **Test Location** | [Repository name, GitHub organization] |

---

## Test Personnel

| Role | Name | Signature/Approval |
|------|------|-------------------|
| **Test Executor** | [Name] | [Executed on Date] |
| **Test Witness** (if applicable) | [Name] | [Witnessed on Date] |
| **Reviewer** | [Name] | [Reviewed on Date] |

---

## Test Environment

| Parameter | Value |
|-----------|-------|
| **Repository Name** | [Organization/repository-name] |
| **GitHub Organization** | [Organization name] |
| **GitHub Plan** | [Free / Team / Enterprise] |
| **Git Version** (local, if applicable) | [e.g., 2.40.0] |
| **Test User Accounts** | [List test users and their roles] |

---

## Test Step Execution

### Test Step [Number]: [Test Step Title]

**Objective:** [What is being verified in this step]

**Actions Performed:**
[Describe specific actions taken during test execution]

**Results Observed:**
[Describe what was observed/outcome]

**Expected Results:**
[Reference expected results from test protocol]

**Comparison:**
- [ ] Results match expected behavior
- [ ] Results differ from expected (see Deviation Log)

**Pass/Fail:** [PASS / FAIL]

**Evidence Collected:**
- [Evidence item 1: e.g., Screenshot-001.png]
- [Evidence item 2: e.g., git-log-output.txt]
- [Evidence location: Path to evidence files]

**Notes:**
[Any additional observations, clarifications, or context]

---

### Test Step [Number]: [Test Step Title]

[Repeat structure for each test step]

---

## Overall Test Result

| Metric | Value |
|--------|-------|
| **Total Test Steps** | [Number] |
| **Passed Steps** | [Number] |
| **Failed Steps** | [Number] |
| **Skipped Steps** | [Number] |
| **Not Applicable Steps** | [Number] |

**Overall Result:** [PASS / FAIL / INCOMPLETE]

**Summary:**
[Provide brief summary of test execution, highlighting key findings]

---

## Deviations

| Deviation ID | Test Step | Description | Severity | Resolution | Status |
|--------------|-----------|-------------|----------|------------|--------|
| [e.g., DEV-001] | [Step X] | [Description of deviation] | [Critical/Major/Minor] | [Corrective action taken or planned] | [Open/Resolved] |

**Note:** If deviations exist, document in the Deviation Log (`Deviation-Log.md`) and reference here.

---

## Evidence Artifacts

List all evidence collected during test execution:

| Evidence ID | Description | File Name/Location | Reference Test Step |
|-------------|-------------|-------------------|---------------------|
| E-001 | Screenshot of branch protection settings | evidence/TP-01/branch-protection-config.png | Step 1 |
| E-002 | Terminal output of rejected push | evidence/TP-01/rejected-push.txt | Step 2 |
| [Add rows as needed] | | | |

**Evidence Storage Location:** [Path or folder where evidence is stored]

---

## Test Execution Approval

**Test Execution Completed By:**
- Name: [Name]
- Role: [Role]
- Date: [Date]
- Signature: [Documented via approval record]

**Test Execution Reviewed By:**
- Name: [Name]
- Role: [Quality/Regulatory]
- Date: [Date]
- Review Comments: [Any comments or observations]
- Signature: [Documented via approval record]

**Test Execution Approved By:**
- Name: [Name]
- Role: [Quality/Regulatory Lead]
- Date: [Date]
- Approval Status: [Approved / Rejected / Pending]
- Signature: [Documented via Pull Request approval and merge]

---

## Additional Notes

[Any additional information, context, or observations relevant to test execution]

---

## Related Documents

- Test Protocol: [Reference to specific test protocol file]
- Deviation Log: `09_Test-Execution-Templates/Deviation-Log.md`
- Validation Summary Report: `10_Validation-Summary-Report-Template.md`

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
