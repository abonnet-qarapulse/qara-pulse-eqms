---
doc_id: VAL-EQMS-GIT-TP-04
title: "Test Protocol - CI/CD Quality Gates"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Test Protocol TP-04: CI/CD Quality Gates

## Test Objective

Verify that automated quality gates (CI/CD workflows) execute on Pull Requests and that branch protection enforces passing status checks before merge, preventing non-compliant documents from entering the QMS.

---

## Critical Function Verified

**CF-04: CI/CD Quality Gates Execution**

---

## Risks Addressed

- **R-04:** Document metadata inconsistency
- **R-07:** CI/CD quality gate failure (gate not executed or bypassed)

---

## Scope

This test protocol verifies:

1. GitHub Actions workflows are configured for quality gates
2. CI/CD workflows execute automatically on Pull Requests
3. Quality checks validate document structure and metadata
4. Failed checks prevent PR merge
5. Passing checks allow PR merge (when other requirements are met)
6. Branch protection enforces required status checks

---

## Preconditions

- GitHub Actions workflows are configured (`.github/workflows/*.yml`)
- At least one quality gate workflow is defined (e.g., document validation, metadata check, linting)
- Branch protection on `main` has "Require status checks to pass before merging" enabled
- Specific required checks are selected in branch protection settings
- Test users available:
  - **Test Author:** User with write access (can create branches and PRs)
  - **Test Reviewer:** User with review permissions (if needed for approval)

---

## Test Steps and Expected Results

### Test Step 1: Verify CI/CD Workflow Configuration

**Objective:** Confirm GitHub Actions workflows are present and correctly configured.

**Actions:**
1. Check for workflow files:
   ```bash
   ls -la .github/workflows/
   ```
2. Review workflow file(s) content (e.g., `.github/workflows/validate-qms-documents.yml`)
3. Verify workflow includes:
   - Trigger on `pull_request` events
   - Jobs that perform quality checks (e.g., validate YAML metadata, check document structure)
   - Clear job names that will appear as status checks

**Expected Results:**
- At least one workflow file exists in `.github/workflows/`
- Workflow is configured to trigger on Pull Request events
- Workflow defines quality check job(s) relevant to QMS document validation

**Pass Criteria:**
CI/CD workflow configuration is present and appropriate for QMS validation.

**Evidence to Collect:**
- Copy of workflow YAML file(s)
- Screenshot of GitHub Actions workflows list in repository

---

### Test Step 2: Verify Branch Protection Requires Status Checks

**Objective:** Confirm branch protection enforces required status checks before merge.

**Actions:**
1. Log in to GitHub as admin
2. Navigate to repository → Settings → Branches
3. View branch protection rule for `main`
4. Locate "Require status checks to pass before merging" setting
5. Verify specific status checks are selected as required

**Expected Results:**
- "Require status checks to pass before merging" is **enabled**
- At least one status check is selected as required (e.g., "validate-qms-documents", "lint", etc.)
- "Require branches to be up to date before merging" may be enabled (organizational choice)

**Pass Criteria:**
Branch protection enforces required status checks.

**Evidence to Collect:**
- Screenshot of branch protection settings showing:
  - "Require status checks to pass before merging" enabled
  - List of required status checks

---

### Test Step 3: Create PR with Compliant Document (Passing Checks)

**Objective:** Verify that CI/CD workflow executes and passes when document is compliant.

**Actions:**
1. As Test Author, create feature branch:
   ```bash
   git checkout -b test/ci-quality-gates-pass
   ```
2. Make a compliant change to a QMS document:
   - Edit a document with valid YAML metadata
   - Ensure document structure is correct
   - Example: Add a paragraph to a procedure
3. Commit and push:
   ```bash
   git add .
   git commit -m "Test: CI quality gates with compliant document"
   git push origin test/ci-quality-gates-pass
   ```
4. Create Pull Request to `main`
5. Observe PR status and GitHub Actions execution:
   - Navigate to PR → "Checks" tab
   - Watch workflow execution in real-time or view results

**Expected Results:**
- GitHub Actions workflow triggers automatically on PR creation
- Workflow runs and executes quality check job(s)
- All checks **pass** (green checkmark)
- PR shows "All checks have passed"
- Merge button status reflects passing checks (may still be disabled if other requirements like approvals are not met)

**Pass Criteria:**
CI/CD workflow executes automatically and passes for compliant document.

**Evidence to Collect:**
- Screenshot of PR showing:
  - "All checks have passed" status
  - Green checkmark for quality gate checks
- Screenshot of GitHub Actions workflow run showing successful execution
- Workflow logs showing validation steps completed

---

### Test Step 4: Create PR with Non-Compliant Document (Failing Checks)

**Objective:** Verify that CI/CD workflow detects non-compliance and prevents merge.

**Actions:**
1. As Test Author, create new feature branch:
   ```bash
   git checkout -b test/ci-quality-gates-fail
   ```
2. Make a non-compliant change that will cause quality gate to fail:
   - **Option A:** Create document with invalid/missing YAML metadata (e.g., remove `doc_id` field)
   - **Option B:** Create document with incorrect structure
   - **Option C:** Introduce syntax error (e.g., malformed YAML header)
   - Example:
     ```markdown
     ---
     title: "Test Document"
     # Missing required fields like doc_id, owner, etc.
     ---
     # Document content
     ```
3. Commit and push:
   ```bash
   git add .
   git commit -m "Test: CI quality gates with non-compliant document"
   git push origin test/ci-quality-gates-fail
   ```
4. Create Pull Request to `main`
5. Observe PR status and GitHub Actions execution

**Expected Results:**
- GitHub Actions workflow triggers automatically
- Workflow runs and quality check job(s) **fail** (red X)
- PR shows "Some checks were not successful" or similar message
- Merge button is **disabled** with message "Required checks must pass before merging"
- Error details are visible in workflow logs

**Pass Criteria:**
CI/CD workflow detects non-compliance and prevents merge.

**Evidence to Collect:**
- Screenshot of PR showing:
  - Failed status check (red X)
  - "Required checks must pass before merging" message
  - Disabled merge button
- Screenshot of GitHub Actions workflow run showing failed execution
- Workflow logs showing validation failure details

---

### Test Step 5: Fix Non-Compliant Document and Verify Re-Check

**Objective:** Verify that fixing issues triggers re-check and allows merge when checks pass.

**Actions:**
1. Using PR from Test Step 4, fix the non-compliance:
   - Correct the document (e.g., add missing YAML metadata fields)
2. Commit and push fix:
   ```bash
   git add .
   git commit -m "Fix: Correct metadata to pass quality gates"
   git push origin test/ci-quality-gates-fail
   ```
3. Observe PR status update

**Expected Results:**
- New commit triggers CI/CD workflow automatically
- Workflow re-runs with updated code
- Quality checks now **pass** (green checkmark)
- PR shows "All checks have passed"
- Merge button becomes available (if other requirements like approvals are met)

**Pass Criteria:**
Correcting issues allows checks to pass and unblocks merge.

**Evidence to Collect:**
- Screenshot of PR after fix showing:
  - Passing status checks (green checkmark)
  - Merge button enabled (or indicating checks passed)
- GitHub Actions workflow run showing successful execution after fix

---

### Test Step 6: Verify Multiple Workflow Jobs (If Applicable)

**Objective:** If multiple CI jobs are configured, verify all must pass.

**Note:** This test is applicable only if multiple quality gate jobs are defined (e.g., metadata validation AND linting AND index check).

**Actions:**
1. Create a PR that passes some checks but fails others (if possible to isolate)
2. Observe PR status when some checks pass and others fail

**Expected Results:**
- PR shows mixed status (some checks pass, some fail)
- Merge is **blocked** until all required checks pass
- Individual check status is clearly visible (which passed, which failed)

**Pass Criteria:**
All required checks must pass; failure of any check blocks merge.

**Evidence to Collect:**
- Screenshot of PR showing mixed check status (if achievable)
- Screenshot demonstrating merge is blocked when any required check fails

---

### Test Step 7: Verify Status Check Cannot Be Bypassed (If Configured)

**Objective:** Verify that required status checks cannot be bypassed by repository admins (if "Do not allow bypassing" is enabled).

**Actions:**
1. Using a PR with failing status checks, attempt to merge as admin (if permitted by configuration)
2. Observe if merge is allowed or blocked

**Expected Results:**
- If "Do not allow bypassing the above settings" is enabled: Admin cannot merge, merge is blocked
- If bypass is allowed: Admin can merge despite failing checks (note this as configuration decision)

**Pass Criteria:**
Behavior matches organization's intended configuration (bypass enabled or disabled as per policy).

**Evidence to Collect:**
- Screenshot showing bypass attempt result
- Documentation of organization's bypass policy for status checks

---

## Overall Test Pass Criteria

This test protocol is considered **PASSED** when:

1. CI/CD workflow configuration is verified (Test Step 1)
2. Branch protection requires status checks (Test Step 2)
3. Compliant document triggers workflow and passes (Test Step 3)
4. Non-compliant document triggers workflow and fails, blocking merge (Test Step 4)
5. Fixing issues allows checks to pass and unblocks merge (Test Step 5)
6. Multiple checks are all enforced (Test Step 6, if applicable)
7. Bypass behavior matches organizational policy (Test Step 7)

**Any failure requires investigation, corrective action, and retest.**

---

## Test Execution

**Test Execution Date:** [TBD]  
**Tester(s):** [TBD]  
**Test Environment:** [Repository name, GitHub organization]  
**Test Result:** [PASS / FAIL / INCOMPLETE]

**Deviations:** [Document any deviations in Deviation Log]

**Evidence Location:** [Path to collected screenshots and workflow logs]

---

## Approval

**Reviewed By:** [Name, Role]  
**Review Date:** [Date]  
**Approval Status:** [Approved / Rejected / Pending]

---

## Related Documents

- Critical Functions and Controls (06_Critical-Functions-and-Controls.md)
- Traceability Matrix (07_Traceability-Matrix.md)
- GitHub Actions workflow files (`.github/workflows/*.yml`)

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
