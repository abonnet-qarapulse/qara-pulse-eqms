---
doc_id: VAL-EQMS-GIT-TP-03
title: "Test Protocol - Pull Request Change Control Workflow"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Test Protocol TP-03: Pull Request Change Control Workflow

## Test Objective

Verify that the Pull Request (PR) workflow functions as the formal change control mechanism for QMS documents, ensuring all changes are proposed, reviewed, documented, and approved before becoming effective.

---

## Critical Function Verified

**CF-03: Pull Request Change Control Workflow**

---

## Risks Addressed

- **R-01:** Unauthorized modification of controlled documents
- **R-08:** PR merge without proper review

---

## Scope

This test protocol verifies:

1. Pull Request workflow is required for all changes to controlled documents
2. PR template guides authors to provide rationale and impact analysis
3. Review and discussion are recorded in PR
4. Approval workflow is enforced
5. Merge to `main` makes document effective
6. PR serves as complete change control record

---

## Preconditions

- Branch protection on `main` requires Pull Request workflow
- Pull Request template exists (`.github/pull_request_template.md`)
- Test users available:
  - **Test Author:** User with write access (can create branches and PRs)
  - **Test Reviewer 1:** User with write/review access
  - **Test Reviewer 2:** User with write/review access (if multiple approvals required)
  - **CODEOWNER:** User designated as code owner for test path (if applicable)

---

## Test Steps and Expected Results

### Test Step 1: Verify Pull Request Template Exists

**Objective:** Confirm PR template is present to guide change proposal documentation.

**Actions:**
1. Check for PR template file:
   ```bash
   ls -la .github/pull_request_template.md
   ```
2. Review PR template content
3. Verify template includes guidance for:
   - Description of change
   - Rationale/justification
   - Impact analysis
   - Related documents or issues

**Expected Results:**
- PR template file exists at `.github/pull_request_template.md`
- Template provides structured guidance for change documentation

**Pass Criteria:**
PR template exists and provides appropriate guidance.

**Evidence to Collect:**
- Copy of PR template content

---

### Test Step 2: Create Feature Branch and Propose Change via Pull Request

**Objective:** Verify that changes must be proposed through Pull Request workflow.

**Actions:**
1. As Test Author, create feature branch:
   ```bash
   git checkout -b test/change-control-workflow
   ```
2. Make a test change to a QMS document (e.g., add section to a procedure):
   - Edit file: `qms/03_procedures/Change-Control-Procedure.md`
   - Add test content (e.g., "Test change for validation")
3. Commit change:
   ```bash
   git add qms/03_procedures/Change-Control-Procedure.md
   git commit -m "Test: Verify PR change control workflow"
   ```
4. Push feature branch:
   ```bash
   git push origin test/change-control-workflow
   ```
5. Create Pull Request via GitHub UI:
   - Navigate to repository on GitHub
   - Click "Pull requests" → "New pull request"
   - Select base: `main`, compare: `test/change-control-workflow`
   - Click "Create pull request"
6. Observe that PR template auto-populates description field
7. Fill out PR template with:
   - Change description
   - Rationale
   - Impact statement
8. Submit Pull Request

**Expected Results:**
- Feature branch and commit are created successfully
- PR is created and assigned a PR number
- PR template guides author to provide rationale and impact
- PR shows proposed changes (diff view)
- PR is linked to `main` branch
- Merge button exists but is disabled (requirements not yet met)

**Pass Criteria:**
Pull Request workflow successfully captures change proposal with documentation.

**Evidence to Collect:**
- Screenshot of created Pull Request showing:
  - PR number and title
  - Filled-out description with rationale
  - Diff of proposed changes
  - Disabled merge button

---

### Test Step 3: Verify Review and Discussion are Recorded

**Objective:** Confirm that review comments and discussion are captured in PR.

**Actions:**
1. As Test Reviewer 1, navigate to the PR created in Test Step 2
2. Add comments to the PR:
   - General comment on PR conversation tab
   - Inline comment on specific line in diff view (e.g., "Please clarify this wording")
3. As Test Author, respond to comments:
   - Reply to inline comment
   - Make additional commit to address feedback:
     ```bash
     git checkout test/change-control-workflow
     # Make changes based on feedback
     git add .
     git commit -m "Address review feedback"
     git push origin test/change-control-workflow
     ```
4. Observe that new commit appears in PR
5. Verify comments and responses are preserved

**Expected Results:**
- Comments can be added to PR (general and inline)
- Discussion thread is visible and organized
- Additional commits automatically appear in PR
- All comments, responses, and commits are timestamped and attributed to users
- Conversation history is preserved

**Pass Criteria:**
PR captures complete review discussion with traceability.

**Evidence to Collect:**
- Screenshot of PR showing:
  - General comment thread
  - Inline comment on diff
  - Response from author
  - Additional commit addressing feedback

---

### Test Step 4: Verify Approval Workflow is Enforced

**Objective:** Confirm that PR requires formal approval before merge is allowed.

**Actions:**
1. Using PR from previous steps, verify merge button status before approvals
2. As Test Reviewer 1, submit a review:
   - Click "Review changes"
   - Select "Request changes" (to test rejection path)
   - Provide comment: "Please correct [issue]"
   - Submit review
3. Observe PR status after "Request changes"
4. As Test Author, address requested changes (make commit)
5. As Test Reviewer 1, submit new review:
   - Click "Review changes"
   - Select "Approve"
   - Submit review
6. If multiple approvals are required, repeat with Test Reviewer 2
7. Observe merge button status after required approvals are met

**Expected Results:**
- Before reviews: Merge blocked, status indicates "X approving reviews required"
- After "Request changes" review: Merge blocked, status shows change request must be addressed
- After dismissal/resolution: Change request is cleared
- After "Approve" review(s): Merge button becomes available (if all requirements met)
- PR clearly shows approval status and which reviewers approved

**Pass Criteria:**
Approval workflow prevents merge until requirements are satisfied.

**Evidence to Collect:**
- Screenshot of PR with "Request changes" review showing blocked merge
- Screenshot of PR after approval showing satisfied requirements
- Screenshot showing list of reviews and their status

---

### Test Step 5: Verify Merge Makes Change Effective

**Objective:** Confirm that merging PR makes the change effective in main branch.

**Actions:**
1. With all requirements satisfied, merge the PR:
   - Click "Merge pull request"
   - Confirm merge
2. Observe merge completion
3. Navigate to `main` branch and verify change is present:
   ```bash
   git checkout main
   git pull
   cat qms/03_procedures/Change-Control-Procedure.md
   ```
4. Check Git log:
   ```bash
   git log --oneline -5
   ```

**Expected Results:**
- PR merges successfully
- PR status changes to "Merged"
- Merge commit appears in `main` branch history
- Changed document in `main` branch reflects the approved changes
- Merge timestamp is recorded

**Pass Criteria:**
Merge successfully integrates approved change into main branch, making it effective.

**Evidence to Collect:**
- Screenshot of merged PR showing "Merged" status and merge timestamp
- Git log output showing merge commit
- Content of modified file in main branch

---

### Test Step 6: Verify PR Serves as Complete Change Control Record

**Objective:** Confirm that PR contains all elements of a change control record.

**Actions:**
1. Review the merged PR from Test Step 5
2. Verify PR contains:
   - **Change proposal:** PR description with rationale and impact
   - **Proposed changes:** Diff view showing exact changes
   - **Review discussion:** Comments and responses
   - **Approval:** Formal review approvals with reviewer identity and timestamp
   - **Decision:** Merge action with timestamp and who merged
   - **Traceability:** PR number, commits, linked issues (if any)

**Expected Results:**
- PR contains all elements required for change control record
- All information is preserved and accessible after merge
- Traceability from proposal to approval to effectiveness is complete

**Pass Criteria:**
PR functions as a complete, auditable change control record.

**Evidence to Collect:**
- Screenshot of merged PR showing all elements:
  - Description with rationale
  - Diff of changes
  - Review discussion
  - Approvals
  - Merge confirmation

---

### Test Step 7: Verify Closed PR Without Merge Does Not Affect Main Branch

**Objective:** Confirm that closing a PR without merging does not make changes effective.

**Actions:**
1. Create a new test PR (similar to Test Step 2)
2. Do not merge the PR; instead, close it without merging:
   - Click "Close pull request"
3. Verify `main` branch does not contain the proposed changes:
   ```bash
   git checkout main
   git pull
   # Verify changes are not present
   ```

**Expected Results:**
- PR can be closed without merging
- Closed PR shows status "Closed" (not "Merged")
- Changes remain only in feature branch
- `main` branch is unaffected

**Pass Criteria:**
Closing PR without merge does not affect controlled documents in main branch.

**Evidence to Collect:**
- Screenshot of closed (not merged) PR
- Verification that main branch does not contain the proposed changes

---

## Overall Test Pass Criteria

This test protocol is considered **PASSED** when:

1. PR template exists and guides change documentation (Test Step 1)
2. Changes are proposed through PR workflow (Test Step 2)
3. Review and discussion are recorded in PR (Test Step 3)
4. Approval workflow is enforced (Test Step 4)
5. Merge makes change effective (Test Step 5)
6. PR serves as complete change control record (Test Step 6)
7. Closed PR without merge does not affect main (Test Step 7)

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
- Change Control Procedure

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
