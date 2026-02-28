---
doc_id: VAL-EQMS-GIT-TP-01
title: "Test Protocol - Branch Protection Enforcement"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Test Protocol TP-01: Branch Protection Enforcement

## Test Objective

Verify that GitHub branch protection rules on the `main` branch are correctly configured and effectively prevent unauthorized actions that could compromise document control integrity.

---

## Critical Function Verified

**CF-01: Branch Protection Enforcement**

---

## Risks Addressed

- **R-01:** Unauthorized modification of controlled documents
- **R-02:** Loss of audit trail (history deletion, force push)
- **R-08:** PR merge without proper review

---

## Scope

This test protocol verifies the following branch protection controls:

1. Direct commits to `main` branch are prevented
2. Pull Request workflow is required for all changes
3. Minimum number of reviewers is enforced
4. Force push to `main` branch is prevented
5. Branch deletion is prevented
6. Required status checks are enforced (if configured)
7. Review dismissal rules are enforced (if configured)

---

## Preconditions

- GitHub repository is configured with branch protection rules on `main` branch
- Test user accounts are available with appropriate permissions:
  - **Test User A:** Write access (can create branches and PRs)
  - **Test User B:** Write access (reviewer)
  - **Test Admin:** Admin access (for configuration verification)
- Git client is installed on test machine
- Test users are authenticated to GitHub

---

## Test Steps and Expected Results

### Test Step 1: Verify Branch Protection Configuration

**Objective:** Confirm branch protection settings are correctly configured.

**Actions:**
1. Log in to GitHub as Test Admin
2. Navigate to repository → Settings → Branches
3. Locate branch protection rule for `main` branch
4. Review configuration settings

**Expected Results:**
- Branch protection rule exists for `main` branch
- The following settings are enabled (at minimum):
  - ☑ Require a pull request before merging
  - ☑ Require approvals (minimum: [organization to specify, e.g., 1])
  - ☑ Require review from Code Owners (if CODEOWNERS is used)
  - ☑ Require status checks to pass before merging (if CI/CD is configured)
  - ☑ Do not allow bypassing the above settings (recommended)
  - ☑ Do not allow force pushes
  - ☑ Do not allow deletions

**Pass Criteria:**
All required settings are enabled and correctly configured.

**Evidence to Collect:**
- Screenshot of branch protection settings page showing all enabled rules

---

### Test Step 2: Attempt Direct Commit to Main Branch

**Objective:** Verify that direct commits to `main` branch are blocked.

**Actions:**
1. Clone repository locally as Test User A:
   ```bash
   git clone [repository-url]
   cd [repository-name]
   ```
2. Ensure local branch is `main`:
   ```bash
   git checkout main
   git pull
   ```
3. Make a test change to a file (e.g., add comment to README.md)
4. Commit the change:
   ```bash
   git add .
   git commit -m "Test: Direct commit attempt"
   ```
5. Attempt to push directly to `main`:
   ```bash
   git push origin main
   ```

**Expected Results:**
- Push is **rejected** by GitHub
- Error message indicates branch protection prevents direct push
- Example error: `remote: error: GH006: Protected branch update failed for refs/heads/main`

**Pass Criteria:**
Direct push to `main` is rejected. Commit remains only in local repository.

**Evidence to Collect:**
- Terminal output showing rejected push attempt
- Screenshot or copy of error message

---

### Test Step 3: Verify Pull Request Workflow is Required

**Objective:** Verify that changes can only be merged through Pull Request workflow.

**Actions:**
1. As Test User A, create a feature branch:
   ```bash
   git checkout -b test/branch-protection-verification
   ```
2. Make a test change (e.g., add line to a document)
3. Commit and push the feature branch:
   ```bash
   git add .
   git commit -m "Test: Verify PR workflow requirement"
   git push origin test/branch-protection-verification
   ```
4. Create a Pull Request from feature branch to `main` via GitHub UI
5. Observe PR status and merge button state

**Expected Results:**
- Feature branch push succeeds (branch protection applies to `main`, not feature branches)
- Pull Request is created successfully
- Merge button is disabled or shows "Merge blocked" until requirements are met
- PR indicates required checks (approvals, status checks, etc.)

**Pass Criteria:**
PR cannot be merged until all branch protection requirements are satisfied.

**Evidence to Collect:**
- Screenshot of Pull Request showing blocked merge status
- Screenshot showing required checks/approvals

---

### Test Step 4: Verify Minimum Reviewer Requirement

**Objective:** Verify that PR cannot be merged without required number of approvals.

**Actions:**
1. Using PR created in Test Step 3, attempt to merge without reviews:
   - As Test User A (PR author), observe merge button state
2. As Test User B (reviewer), review and approve the PR:
   - Navigate to PR
   - Click "Review changes"
   - Select "Approve"
   - Submit review
3. Observe if merge button becomes available after required approvals

**Expected Results:**
- Before review: Merge button is disabled, indicates "X approving review required"
- After review by Test User B: Merge button becomes available (if no other requirements remain)
- PR author (Test User A) cannot approve their own PR (if "Dismiss stale pull request approvals when new commits are pushed" is enabled)

**Pass Criteria:**
PR can only be merged after receiving the required number of approvals from authorized reviewers.

**Evidence to Collect:**
- Screenshot of PR before approval showing blocked merge
- Screenshot of PR after approval showing merge is allowed (if all other requirements met)

---

### Test Step 5: Attempt Force Push to Main Branch

**Objective:** Verify that force push is prevented to protect audit trail integrity.

**Actions:**
1. As Test User A, clone repository and checkout `main` branch
2. Rewrite commit history locally (e.g., amend a commit or rebase):
   ```bash
   git commit --amend -m "Test: Amended commit"
   ```
3. Attempt force push:
   ```bash
   git push --force origin main
   ```

**Expected Results:**
- Force push is **rejected** by GitHub
- Error message indicates branch protection prevents force push
- Example error: `remote: error: GH006: Protected branch update failed`

**Pass Criteria:**
Force push to `main` is rejected. Commit history cannot be rewritten.

**Evidence to Collect:**
- Terminal output showing rejected force push attempt
- Screenshot or copy of error message

---

### Test Step 6: Attempt Branch Deletion

**Objective:** Verify that `main` branch cannot be deleted.

**Actions:**
1. As Test User A or Test Admin, attempt to delete `main` branch via Git command:
   ```bash
   git push origin --delete main
   ```
2. Alternatively, attempt branch deletion via GitHub UI:
   - Navigate to repository → Branches
   - Attempt to delete `main` branch

**Expected Results:**
- Branch deletion is **rejected** by GitHub
- Error message indicates branch protection prevents deletion
- GitHub UI does not show delete option for `main` branch (or shows error if attempted)

**Pass Criteria:**
`main` branch cannot be deleted through any method.

**Evidence to Collect:**
- Terminal output showing rejected deletion attempt (if using Git command)
- Screenshot of GitHub UI showing delete option is unavailable or rejected

---

### Test Step 7: Verify Required Status Checks Enforcement (If Applicable)

**Objective:** Verify that PR cannot be merged if required CI/CD status checks fail.

**Note:** This test is applicable only if CI/CD quality gates (GitHub Actions) are configured and required status checks are enabled in branch protection.

**Actions:**
1. Create a new test PR that intentionally causes CI/CD check to fail:
   - Create feature branch
   - Make a change that violates a quality gate (e.g., invalid YAML metadata, if such checks exist)
   - Push and create PR
2. Observe PR status after CI/CD runs
3. Observe merge button state

**Expected Results:**
- CI/CD workflow executes on PR
- Failed status check is reported on PR
- Merge button is disabled with message "Required checks must pass"
- PR cannot be merged until status checks pass

**Pass Criteria:**
PR cannot be merged when required status checks fail.

**Evidence to Collect:**
- Screenshot of PR showing failed status check
- Screenshot of disabled merge button with failure reason

---

## Overall Test Pass Criteria

This test protocol is considered **PASSED** when:

1. Branch protection configuration is verified correct (Test Step 1)
2. Direct commit to `main` is successfully blocked (Test Step 2)
3. Pull Request workflow is enforced (Test Step 3)
4. Required approvals are enforced (Test Step 4)
5. Force push is successfully blocked (Test Step 5)
6. Branch deletion is successfully blocked (Test Step 6)
7. Required status checks are enforced (Test Step 7, if applicable)

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
- Test Execution Record Template (09_Test-Execution-Templates/Test-Execution-Record.md)

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
