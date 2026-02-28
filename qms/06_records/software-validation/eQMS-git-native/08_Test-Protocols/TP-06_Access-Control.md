---
doc_id: VAL-EQMS-GIT-TP-06
title: "Test Protocol - Access Control and Authorization"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Test Protocol TP-06: Access Control and Authorization

## Test Objective

Verify that GitHub repository access control is correctly configured to restrict access based on roles and responsibilities, ensuring only authorized personnel can access and modify QMS documents.

---

## Critical Function Verified

**CF-06: Access Control and Authorization**

---

## Risks Addressed

- **R-06:** Access misconfiguration (unauthorized access granted, legitimate access denied)

---

## Scope

This test protocol verifies:

1. Repository visibility is set to private (confidentiality)
2. User access is controlled through GitHub teams and permissions
3. Different permission levels function as intended (Read, Write, Admin)
4. Unauthorized users cannot access repository
5. Authorized users have appropriate access levels
6. Two-factor authentication (2FA) is enforced (if organizational policy)

---

## Preconditions

- Repository access control is configured
- GitHub teams are defined (e.g., `qms-readers`, `qms-authors`, `qms-approvers`, `qms-admins`)
- Test user accounts available:
  - **Test Unauthorized User:** User not granted access to repository
  - **Test Read User:** User with Read permission
  - **Test Write User:** User with Write permission
  - **Test Admin User:** User with Admin permission
- Organization 2FA policy is defined (if applicable)

---

## Test Steps and Expected Results

### Test Step 1: Verify Repository Visibility is Private

**Objective:** Confirm repository is set to private to protect QMS confidentiality.

**Actions:**
1. Log in to GitHub as admin
2. Navigate to repository → Settings → General
3. Check "Repository visibility" section
4. Verify visibility is set to "Private"

**Expected Results:**
- Repository visibility is **Private**
- Repository is not publicly accessible
- Only organization members with explicit access can view repository

**Pass Criteria:**
Repository is private.

**Evidence to Collect:**
- Screenshot of repository settings showing "Private" visibility

---

### Test Step 2: Verify Access Control Configuration

**Objective:** Confirm GitHub teams and user permissions are correctly configured.

**Actions:**
1. Log in to GitHub as admin
2. Navigate to repository → Settings → Collaborators and teams
3. Review list of teams and individual users with access
4. Verify each team/user has appropriate permission level:
   - **Read:** View documents and history only
   - **Write:** Create branches, open PRs, review
   - **Maintain:** Some settings management (if used)
   - **Admin:** Full control

**Expected Results:**
- Teams and users are listed with assigned permissions
- Permission levels align with organization's access control matrix
- No unexpected or unauthorized users have access

**Pass Criteria:**
Access control configuration matches intended access matrix.

**Evidence to Collect:**
- Screenshot of Collaborators and teams page showing:
  - List of teams/users
  - Permission levels assigned

---

### Test Step 3: Test Unauthorized User Cannot Access Repository

**Objective:** Verify that users without explicit access cannot view or interact with repository.

**Actions:**
1. Log in to GitHub as Test Unauthorized User (user not in organization or not granted access)
2. Attempt to navigate to repository URL directly
3. Attempt to clone repository:
   ```bash
   git clone [repository-url]
   ```

**Expected Results:**
- Direct navigation shows "404 Not Found" or "You don't have access to this repository"
- Clone attempt fails with authentication error
- Error message: `remote: Repository not found` or `fatal: Authentication failed`
- Unauthorized user cannot view any repository content

**Pass Criteria:**
Unauthorized user is denied access to repository.

**Evidence to Collect:**
- Screenshot of GitHub UI showing access denied message
- Terminal output showing failed clone attempt

---

### Test Step 4: Test Read-Only User Permissions

**Objective:** Verify that users with Read permission can view but cannot modify repository.

**Actions:**
1. Log in to GitHub as Test Read User
2. Navigate to repository via GitHub UI
3. Verify user can:
   - View documents
   - View commit history
   - View Pull Requests
   - View Issues (if enabled)
4. Verify user cannot:
   - Push commits (attempt to clone, make change, and push)
   - Create branches on remote (attempt: `git push origin test-branch`)
   - Close/merge Pull Requests
   - Modify repository settings

**Expected Results:**
- Test Read User can view all repository content via GitHub UI
- Test Read User can clone repository locally:
  ```bash
  git clone [repository-url]
  ```
- Test Read User cannot push changes:
  ```bash
  git push origin test-branch
  # Expected error: "Permission denied"
  ```
- GitHub UI does not show options to create PRs, merge, or modify settings

**Pass Criteria:**
Read permission allows viewing but prevents modifications.

**Evidence to Collect:**
- Screenshot of GitHub UI showing Read user can view documents
- Terminal output showing failed push attempt with permission error

---

### Test Step 5: Test Write User Permissions

**Objective:** Verify that users with Write permission can create branches and PRs but cannot bypass approval workflow.

**Actions:**
1. Log in to GitHub as Test Write User
2. Clone repository:
   ```bash
   git clone [repository-url]
   ```
3. Create feature branch:
   ```bash
   git checkout -b test/write-user-permissions
   ```
4. Make a test change and commit:
   ```bash
   echo "Test change" >> README.md
   git add README.md
   git commit -m "Test: Write user permissions"
   ```
5. Push feature branch:
   ```bash
   git push origin test/write-user-permissions
   ```
6. Create Pull Request via GitHub UI
7. Attempt to merge PR without required reviews (should be blocked by branch protection)
8. Attempt to push directly to `main` (should be blocked):
   ```bash
   git checkout main
   git pull
   echo "Direct commit test" >> README.md
   git add README.md
   git commit -m "Test: Direct commit to main"
   git push origin main
   ```

**Expected Results:**
- Test Write User can clone, create branches, commit, and push feature branches
- Test Write User can create Pull Requests
- Test Write User **cannot** push directly to `main` (branch protection blocks)
- Test Write User **cannot** merge PR without required approvals (branch protection blocks)
- Test Write User can review and approve PRs (if not restricted further)

**Pass Criteria:**
Write permission allows branch/PR creation but branch protection prevents bypassing approval workflow.

**Evidence to Collect:**
- Screenshot showing successful feature branch push
- Screenshot of created Pull Request
- Terminal output showing blocked direct push to `main`
- Screenshot showing PR cannot be merged without approvals

---

### Test Step 6: Test Admin User Permissions

**Objective:** Verify that users with Admin permission have full control, including settings management.

**Actions:**
1. Log in to GitHub as Test Admin User
2. Verify admin can:
   - Access repository settings
   - Modify branch protection rules (view settings, do not actually change)
   - Manage collaborators and teams (view, do not modify)
   - Push to any branch (if branch protection allows admin bypass, otherwise same restrictions)
3. Verify admin responsibilities:
   - Admin can approve and merge PRs (if authorized as CODEOWNER or reviewer)
   - Admin can manage repository configuration

**Expected Results:**
- Test Admin User can access Settings menu
- Test Admin User can view and modify repository configuration
- Admin permissions do not override branch protection rules (unless "Allow bypass" is explicitly enabled)

**Pass Criteria:**
Admin permission provides full control appropriate for QMS administrator role.

**Evidence to Collect:**
- Screenshot of Admin user accessing Settings menu
- Screenshot showing Admin can view branch protection settings
- Documentation of admin capabilities and any bypass permissions

---

### Test Step 7: Verify Two-Factor Authentication (2FA) Enforcement (If Applicable)

**Objective:** Confirm that organization requires 2FA for all users (if this is organizational policy).

**Actions:**
1. Log in to GitHub organization settings as organization owner/admin
2. Navigate to organization → Settings → Authentication security
3. Verify 2FA requirement status
4. If 2FA is required:
   - Verify test users have 2FA enabled
   - Attempt to access repository from account without 2FA (if possible) to confirm access is denied

**Expected Results:**
- If organization policy requires 2FA:
  - Organization settings show "Require two-factor authentication"
  - Users without 2FA are denied access
- If 2FA is not required:
  - Document as organizational decision

**Pass Criteria:**
2FA enforcement status matches organizational policy.

**Evidence to Collect:**
- Screenshot of organization authentication security settings
- Documentation of 2FA policy and enforcement status

---

### Test Step 8: Verify Team-Based Access Control

**Objective:** Confirm that team membership correctly grants access to users.

**Actions:**
1. Log in to GitHub as organization admin
2. Navigate to organization → Teams
3. Select a QMS-related team (e.g., `qms-authors`)
4. Review team members
5. Verify team has appropriate repository access:
   - Navigate to team → Repositories
   - Verify team is granted access to eQMS repository with correct permission level
6. Test that adding/removing user from team grants/revokes access:
   - (Optional, if permitted) Add a test user to team, verify access is granted
   - (Optional) Remove test user from team, verify access is revoked

**Expected Results:**
- Teams are correctly defined with appropriate members
- Team-level permissions grant access to all team members
- Adding user to team grants access
- Removing user from team revokes access

**Pass Criteria:**
Team-based access control functions correctly.

**Evidence to Collect:**
- Screenshot of team membership list
- Screenshot of team's repository access permissions
- (If tested) Screenshot showing access change after team membership change

---

### Test Step 9: Verify Access Review Documentation

**Objective:** Confirm that access control configuration is documented for periodic review.

**Actions:**
1. Verify that current access control configuration is documented:
   - List of teams and their purpose
   - List of users with direct access (if any)
   - Permission levels assigned
   - Organizational policy for access requests and approvals
2. Verify documentation includes:
   - Date of last access review
   - Process for periodic access review (e.g., quarterly)

**Expected Results:**
- Access control configuration is documented
- Documentation includes current state and review schedule

**Pass Criteria:**
Access control is documented and subject to periodic review.

**Evidence to Collect:**
- Copy of access control documentation
- Reference to organizational procedure for access management and review

---

## Overall Test Pass Criteria

This test protocol is considered **PASSED** when:

1. Repository is private (Test Step 1)
2. Access control configuration is correct (Test Step 2)
3. Unauthorized users cannot access repository (Test Step 3)
4. Read-only permissions function correctly (Test Step 4)
5. Write permissions function correctly (Test Step 5)
6. Admin permissions function correctly (Test Step 6)
7. 2FA enforcement matches policy (Test Step 7, if applicable)
8. Team-based access control functions correctly (Test Step 8)
9. Access control is documented and reviewed (Test Step 9)

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
- Document and Record Control Procedure
- IT Infrastructure Management Procedure

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
