---
doc_id: VAL-EQMS-GIT-TP-02
title: "Test Protocol - CODEOWNERS Approval Authority"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Test Protocol TP-02: CODEOWNERS Approval Authority

## Test Objective

Verify that the CODEOWNERS file correctly defines approval authority for QMS documents, and that GitHub enforces CODEOWNERS approval requirements, ensuring only authorized persons can approve changes.

---

## Critical Function Verified

**CF-02: CODEOWNERS Approval Authority**

---

## Risks Addressed

- **R-01:** Unauthorized modification of controlled documents
- **R-03:** Incorrect approval authority (wrong person approves change)

---

## Scope

This test protocol verifies:

1. CODEOWNERS file exists and is correctly formatted
2. CODEOWNERS file correctly maps QMS documents to authorized approvers
3. Branch protection enforces "Require review from Code Owners"
4. Pull Requests require approval from designated CODEOWNERS
5. Non-CODEOWNER approvals do not satisfy the requirement
6. Multiple CODEOWNERS patterns are correctly applied

---

## Preconditions

- CODEOWNERS file exists at `.github/CODEOWNERS` in repository root
- Branch protection on `main` has "Require review from Code Owners" enabled
- Test user accounts available:
  - **Test User A:** Write access, PR author (not a code owner for test paths)
  - **Test User B:** Write access, reviewer (not a code owner for test paths)
  - **Test Code Owner:** Member of a team or individual user defined as CODEOWNER for test paths
- QMS document paths are defined in CODEOWNERS (e.g., `/qms/03_procedures/`, `/qms/01_governance/`)

---

## Test Steps and Expected Results

### Test Step 1: Verify CODEOWNERS File Exists and is Correctly Located

**Objective:** Confirm CODEOWNERS file is present and in correct location.

**Actions:**
1. Clone repository locally
2. Check for CODEOWNERS file:
   ```bash
   ls -la .github/CODEOWNERS
   ```
3. Display CODEOWNERS file content:
   ```bash
   cat .github/CODEOWNERS
   ```

**Expected Results:**
- CODEOWNERS file exists at `.github/CODEOWNERS`
- File is readable and contains code owner definitions
- File format is correct (lines with path patterns and owners)

**Pass Criteria:**
CODEOWNERS file exists in correct location and is properly formatted.

**Evidence to Collect:**
- Screenshot or text output of CODEOWNERS file content

---

### Test Step 2: Verify CODEOWNERS Mapping for QMS Documents

**Objective:** Confirm CODEOWNERS file correctly maps QMS document paths to authorized approvers.

**Actions:**
1. Review CODEOWNERS file content
2. Verify key QMS paths are defined, for example:
   ```
   # Quality Manual and Governance - Top Management approval
   /qms/01_governance/ @organization/top-management
   
   # Procedures - Quality/Regulatory approval
   /qms/03_procedures/ @organization/quality-regulatory
   
   # Default - QMS approvers
   * @organization/qms-approvers
   ```
3. Verify GitHub teams or users referenced in CODEOWNERS exist and are correctly configured

**Expected Results:**
- Critical QMS paths are mapped to appropriate approvers (teams or individuals)
- More specific paths override general patterns (e.g., `/qms/01_governance/` overrides `*`)
- All referenced GitHub teams/users exist and contain correct members

**Pass Criteria:**
CODEOWNERS mapping aligns with organization's approval authority matrix.

**Evidence to Collect:**
- Copy of CODEOWNERS file content
- Screenshot of GitHub teams mentioned in CODEOWNERS (verify team members)

---

### Test Step 3: Verify Branch Protection Enforces CODEOWNERS Review

**Objective:** Confirm branch protection setting "Require review from Code Owners" is enabled.

**Actions:**
1. Log in to GitHub as admin
2. Navigate to repository → Settings → Branches
3. View branch protection rule for `main`
4. Locate "Require review from Code Owners" setting

**Expected Results:**
- "Require review from Code Owners" is **enabled**
- Setting indicates that PRs must be approved by code owners before merging

**Pass Criteria:**
Branch protection enforces CODEOWNERS review requirement.

**Evidence to Collect:**
- Screenshot of branch protection settings showing "Require review from Code Owners" enabled

---

### Test Step 4: Test PR Requiring CODEOWNER Approval

**Objective:** Verify that PR modifying a QMS document requires approval from the designated code owner.

**Actions:**
1. As Test User A (not a code owner), create a feature branch:
   ```bash
   git checkout -b test/codeowners-verification
   ```
2. Modify a document under a CODEOWNERS-protected path (e.g., `/qms/03_procedures/Change-Control-Procedure.md`)
3. Commit and push:
   ```bash
   git add qms/03_procedures/Change-Control-Procedure.md
   git commit -m "Test: CODEOWNERS enforcement"
   git push origin test/codeowners-verification
   ```
4. Create Pull Request to `main`
5. Observe PR status

**Expected Results:**
- PR is created successfully
- PR shows "Review required from: @organization/quality-regulatory" (or appropriate code owner)
- Merge button is disabled
- Status indicates "Awaiting required review from code owner"

**Pass Criteria:**
PR clearly indicates CODEOWNER approval is required before merge.

**Evidence to Collect:**
- Screenshot of PR showing CODEOWNER review requirement
- Screenshot of disabled merge button with reason

---

### Test Step 5: Test Non-CODEOWNER Approval Does Not Satisfy Requirement

**Objective:** Verify that approval from a user who is not a designated code owner does not satisfy the CODEOWNERS requirement.

**Actions:**
1. Using PR from Test Step 4, have Test User B (who is not a code owner for the modified path) review and approve:
   - Navigate to PR as Test User B
   - Click "Review changes"
   - Select "Approve"
   - Submit review
2. Observe PR merge status after approval

**Expected Results:**
- Test User B's approval is recorded
- PR still shows "Review required from: @organization/quality-regulatory" (or appropriate code owner)
- Merge button remains disabled
- Status indicates code owner approval is still required

**Pass Criteria:**
Non-CODEOWNER approval does not satisfy the CODEOWNERS requirement.

**Evidence to Collect:**
- Screenshot of PR after non-CODEOWNER approval, showing requirement still not met

---

### Test Step 6: Test CODEOWNER Approval Enables Merge

**Objective:** Verify that approval from a designated code owner satisfies the requirement and allows merge.

**Actions:**
1. Using PR from Test Step 4, have Test Code Owner (member of designated CODEOWNER team) review and approve:
   - Log in as Test Code Owner
   - Navigate to PR
   - Click "Review changes"
   - Select "Approve"
   - Submit review
2. Observe PR merge status after CODEOWNER approval

**Expected Results:**
- Test Code Owner's approval is recorded
- CODEOWNERS requirement is satisfied (checkmark or "approved" status)
- Merge button becomes available (assuming no other requirements remain unsatisfied)
- PR can now be merged

**Pass Criteria:**
CODEOWNER approval satisfies the requirement and enables merge.

**Evidence to Collect:**
- Screenshot of PR after CODEOWNER approval, showing requirement satisfied
- Screenshot of enabled merge button

---

### Test Step 7: Test Multiple CODEOWNERS Patterns

**Objective:** Verify that different CODEOWNERS patterns are correctly applied to different document paths.

**Actions:**
1. Create a PR modifying a document under a different CODEOWNERS path (e.g., `/qms/01_governance/Quality-Manual.md`)
2. Observe which code owner team/user is required for this PR
3. Verify the required code owner differs from Test Step 4 (if different paths have different owners)

**Expected Results:**
- PR shows correct CODEOWNER requirement based on file path
- Different paths trigger different CODEOWNER requirements as defined in CODEOWNERS file
- More specific patterns override general patterns (e.g., `/qms/01_governance/` takes precedence over `*`)

**Pass Criteria:**
CODEOWNERS patterns are correctly applied based on file paths.

**Evidence to Collect:**
- Screenshot of PR showing CODEOWNER requirement for different path
- Comparison demonstrating different paths require different code owners

---

### Test Step 8: Verify CODEOWNER Cannot Be Bypassed

**Objective:** Verify that CODEOWNERS requirement cannot be bypassed by repository admins (if "Do not allow bypassing" is enabled).

**Actions:**
1. Using a test PR requiring CODEOWNER approval, attempt to merge as admin without CODEOWNER approval
2. Observe if bypass is allowed or blocked

**Expected Results:**
- If "Do not allow bypassing the above settings" is enabled: Admin cannot bypass, merge is blocked
- If bypass is allowed: Admin can merge (note this as configuration decision)

**Pass Criteria:**
Behavior matches organization's intended configuration (bypass enabled or disabled as per policy).

**Evidence to Collect:**
- Screenshot showing bypass attempt result
- Documentation of organization's bypass policy

---

## Overall Test Pass Criteria

This test protocol is considered **PASSED** when:

1. CODEOWNERS file exists and is correctly formatted (Test Step 1)
2. CODEOWNERS correctly maps QMS paths to approvers (Test Step 2)
3. Branch protection enforces CODEOWNERS review (Test Step 3)
4. PR requires CODEOWNER approval (Test Step 4)
5. Non-CODEOWNER approval does not satisfy requirement (Test Step 5)
6. CODEOWNER approval enables merge (Test Step 6)
7. Multiple CODEOWNERS patterns are correctly applied (Test Step 7)
8. Bypass behavior matches organizational policy (Test Step 8)

**Any failure requires investigation, corrective action, and retest.**

---

## Test Execution

**Test Execution Date:** [TBD]  
**Tester(s):** [TBD]  
**Test Environment:** [Repository name, GitHub organization]  
**Test Result:** [PASS / FAIL / INCOMPLETE]

**Deviations:** [Document any deviations in Deviation Log]

**Evidence Location:** [Path to collected screenshots and outputs]

---

## Approval

**Reviewed By:** [Name, Role]  
**Review Date:** [Date]  
**Approval Status:** [Approved / Rejected / Pending]

---

## Related Documents

- Critical Functions and Controls (06_Critical-Functions-and-Controls.md)
- Traceability Matrix (07_Traceability-Matrix.md)
- CODEOWNERS file (`.github/CODEOWNERS`)

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
