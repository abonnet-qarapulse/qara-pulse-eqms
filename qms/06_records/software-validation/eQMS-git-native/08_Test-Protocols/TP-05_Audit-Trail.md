---
doc_id: VAL-EQMS-GIT-TP-05
title: "Test Protocol - Audit Trail Generation and Preservation"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Test Protocol TP-05: Audit Trail Generation and Preservation

## Test Objective

Verify that the Git-native eQMS automatically generates a complete, immutable audit trail of all changes to controlled documents, and that this audit trail cannot be modified or deleted through normal operations.

---

## Critical Function Verified

**CF-05: Audit Trail Generation and Preservation**

---

## Risks Addressed

- **R-02:** Loss of audit trail (history deletion, force push, repository corruption)

---

## Scope

This test protocol verifies:

1. Git automatically records commit history (who, what, when, why)
2. Pull Request records capture review and approval information
3. Audit trail elements are preserved and cannot be modified
4. Force push and history rewriting are prevented by branch protection
5. Audit trail is retrievable and readable for audits and inspections
6. Traceability from change proposal to approval to effectiveness

---

## Preconditions

- Git repository is initialized with commit history
- Branch protection on `main` prevents force push
- Test users available:
  - **Test Author:** User with write access
  - **Test Reviewer:** User with review access
- At least one completed Pull Request exists (or will be created during test)

---

## Test Steps and Expected Results

### Test Step 1: Verify Git Commit History is Generated

**Objective:** Confirm that Git automatically records commit metadata for all changes.

**Actions:**
1. Create a test change and commit:
   ```bash
   git checkout -b test/audit-trail-verification
   echo "Test change for audit trail" >> qms/03_procedures/Change-Control-Procedure.md
   git add qms/03_procedures/Change-Control-Procedure.md
   git commit -m "Test: Verify audit trail generation"
   ```
2. View commit details:
   ```bash
   git log -1 --format=fuller
   ```
3. Observe commit metadata

**Expected Results:**
- Commit is created successfully
- Commit metadata includes:
  - **Author:** Name and email of person who made the change
  - **AuthorDate:** Timestamp of when change was made
  - **Commit:** Committer information (usually same as author for normal workflow)
  - **CommitDate:** Timestamp of commit
  - **Commit message:** Description of change
  - **Commit hash:** Unique identifier (SHA-1 hash)

**Pass Criteria:**
Git commit contains complete metadata identifying who made the change, when, and what was changed.

**Evidence to Collect:**
- Terminal output of `git log -1 --format=fuller` showing full commit metadata
- Example output demonstrating author, timestamp, and message

---

### Test Step 2: Verify Pull Request Captures Review and Approval

**Objective:** Confirm that Pull Request records include review discussions and approval information.

**Actions:**
1. Using test branch from Test Step 1, push and create Pull Request:
   ```bash
   git push origin test/audit-trail-verification
   ```
2. Create PR via GitHub UI
3. As Test Reviewer, add a comment to the PR
4. As Test Reviewer, submit formal review:
   - Click "Review changes"
   - Select "Approve"
   - Add comment: "Approved for validation test"
   - Submit review
5. As Test Author (or authorized merger), merge the PR
6. After merge, review the closed PR

**Expected Results:**
- PR records include:
  - **PR number:** Unique identifier
  - **Author:** Who proposed the change
  - **Creation timestamp:** When PR was opened
  - **Description:** Change rationale and impact
  - **Comments:** Discussion thread
  - **Review records:** Formal approvals with reviewer identity and timestamp
  - **Merge record:** Who merged, when, and merge commit hash
- All information is preserved after merge
- PR remains accessible after closing

**Pass Criteria:**
Pull Request captures complete change control record including reviews and approvals.

**Evidence to Collect:**
- Screenshot of merged PR showing:
  - PR description
  - Comment thread
  - Review approval(s) with timestamp and reviewer
  - Merge confirmation with timestamp

---

### Test Step 3: Verify Audit Trail Elements are Immutable

**Objective:** Confirm that commit history and metadata cannot be easily modified.

**Actions:**
1. View commit history for main branch:
   ```bash
   git checkout main
   git pull
   git log --oneline -10
   ```
2. Attempt to modify commit history (this should fail due to branch protection):
   - Attempt to amend last commit and force push (should be blocked by branch protection):
     ```bash
     git commit --amend -m "Modified commit message"
     git push --force origin main
     ```
3. Observe error message

**Expected Results:**
- Commit history is viewable and complete
- Force push to `main` is **rejected** by GitHub branch protection
- Error message indicates branch protection prevents history rewriting
- Commit history remains unchanged

**Pass Criteria:**
Branch protection prevents modification of commit history on `main` branch.

**Evidence to Collect:**
- Terminal output showing rejected force push attempt
- Git log showing unchanged commit history

---

### Test Step 4: Verify Audit Trail is Retrievable

**Objective:** Confirm that audit trail can be retrieved for specific documents or time periods.

**Actions:**
1. Query commit history for specific file:
   ```bash
   git log --follow -- qms/03_procedures/Change-Control-Procedure.md
   ```
2. View detailed change history for a file:
   ```bash
   git log -p -- qms/03_procedures/Change-Control-Procedure.md
   ```
3. Query commits within specific time range:
   ```bash
   git log --since="2024-01-01" --until="2024-12-31" --oneline
   ```
4. Query commits by specific author:
   ```bash
   git log --author="Test Author" --oneline
   ```

**Expected Results:**
- Git log commands successfully retrieve:
  - All changes to specific file
  - Detailed diffs for each change
  - Changes within date range
  - Changes by specific author
- Results are complete and accurate
- Historical versions of documents are accessible

**Pass Criteria:**
Audit trail is retrievable by file, date range, and author.

**Evidence to Collect:**
- Terminal output examples of:
  - File-specific history (`git log -- [file]`)
  - Date-range query
  - Author-specific query

---

### Test Step 5: Verify Traceability from Change to Approval

**Objective:** Confirm complete traceability from proposed change through approval to effective date.

**Actions:**
1. Select a merged Pull Request (e.g., from Test Step 2)
2. Trace the change lifecycle:
   - **Proposal:** PR creation timestamp and author
   - **Change content:** Diff view showing exact changes
   - **Review:** Review comments and discussion
   - **Approval:** Review approval(s) with reviewer and timestamp
   - **Effectiveness:** Merge timestamp and commit in main branch
3. Link PR to merge commit:
   ```bash
   git log --oneline --grep="Pull Request #[number]"
   ```
   Or view merge commit:
   ```bash
   git show [merge-commit-hash]
   ```

**Expected Results:**
- Complete traceability chain exists:
  - PR → Commits → Reviews → Approval → Merge → Effective date
- Each step is timestamped and attributed to users
- Merge commit references PR number (in commit message or Git metadata)
- Audit trail demonstrates: who proposed, who reviewed, who approved, when it became effective

**Pass Criteria:**
Complete traceability from change proposal to approval to effectiveness is demonstrable.

**Evidence to Collect:**
- Screenshot of merged PR showing complete lifecycle
- Git log showing merge commit linked to PR
- Diagram or narrative demonstrating traceability chain

---

### Test Step 6: Verify Historical Document Versions are Retrievable

**Objective:** Confirm that previous versions of documents can be retrieved from audit trail.

**Actions:**
1. Identify a document that has been modified multiple times (e.g., `qms/03_procedures/Change-Control-Procedure.md`)
2. View commit history for that document:
   ```bash
   git log --oneline -- qms/03_procedures/Change-Control-Procedure.md
   ```
3. Retrieve a historical version of the document:
   ```bash
   git show [commit-hash]:qms/03_procedures/Change-Control-Procedure.md
   ```
4. Compare two versions:
   ```bash
   git diff [older-commit-hash] [newer-commit-hash] -- qms/03_procedures/Change-Control-Procedure.md
   ```

**Expected Results:**
- Historical versions of documents are accessible via Git
- Specific versions can be retrieved by commit hash or date
- Changes between versions can be compared
- Retrieved versions are complete and readable

**Pass Criteria:**
Historical document versions are retrievable and complete.

**Evidence to Collect:**
- Terminal output showing historical version retrieval
- Example of diff between two versions

---

### Test Step 7: Verify Audit Trail Completeness for Audit Scenario

**Objective:** Demonstrate that audit trail meets regulatory audit requirements.

**Actions:**
1. Select a controlled document (e.g., a procedure)
2. Answer the following audit questions using Git/GitHub:
   - **Who created this document?** (First commit)
   - **Who last modified this document?** (Most recent commit)
   - **What changes were made in the last modification?** (Git diff)
   - **Who approved the last change?** (PR review)
   - **When did the current version become effective?** (PR merge timestamp)
   - **What was the rationale for the change?** (PR description)
   - **What was the document status 6 months ago?** (Git show at specific date)

**Expected Results:**
- All audit questions can be answered using Git commands or GitHub PR records
- Information is readily accessible and documented
- Audit trail is sufficient for regulatory inspection

**Pass Criteria:**
Audit trail provides complete information to answer typical audit questions.

**Evidence to Collect:**
- Document answering each audit question with:
  - Question
  - Git/GitHub command or method used
  - Result/answer
  - Screenshot or output

---

## Overall Test Pass Criteria

This test protocol is considered **PASSED** when:

1. Git commit history is automatically generated with complete metadata (Test Step 1)
2. Pull Request captures review and approval information (Test Step 2)
3. Audit trail elements are immutable (history rewriting prevented) (Test Step 3)
4. Audit trail is retrievable by file, date, and author (Test Step 4)
5. Complete traceability from change to approval is demonstrable (Test Step 5)
6. Historical document versions are retrievable (Test Step 6)
7. Audit trail meets regulatory audit requirements (Test Step 7)

**Any failure requires investigation, corrective action, and retest.**

---

## Test Execution

**Test Execution Date:** [TBD]  
**Tester(s):** [TBD]  
**Test Environment:** [Repository name, GitHub organization]  
**Test Result:** [PASS / FAIL / INCOMPLETE]

**Deviations:** [Document any deviations in Deviation Log]

**Evidence Location:** [Path to collected screenshots, Git outputs, PR records]

---

## Approval

**Reviewed By:** [Name, Role]  
**Review Date:** [Date]  
**Approval Status:** [Approved / Rejected / Pending]

---

## Related Documents

- Critical Functions and Controls (06_Critical-Functions-and-Controls.md)
- Traceability Matrix (07_Traceability-Matrix.md)
- Document and Record Control Procedure

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
