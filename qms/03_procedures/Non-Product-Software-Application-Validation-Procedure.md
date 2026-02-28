---
doc_id: TBD
title: "Non Product Software Application Validation Procedure"
doc_type: "Procedure"
process: "manage-quality-and-regulatory-affairs"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Non-Product Software Application Validation Procedure

## 1. Introduction
### 1.1 Purpose
This procedure defines the requirements and process for validating software applications used in Quality Management System (QMS) activities but not intended as medical devices.

The purpose of non-product software validation is to demonstrate through objective evidence that software tools used in QMS operations are capable of consistently fulfilling their intended use and that their use does not compromise data integrity, document control, or regulatory compliance.

### 1.2 Scope
This procedure applies to:
- Software tools and applications used for QMS operations (document management, quality tools, infrastructure)
- Software-as-a-Service (SaaS) platforms used in QMS activities
- Infrastructure software supporting QMS operations
- Non-product software that impacts data integrity or regulatory compliance

**Out of Scope:**
- Product software development (covered by SDLC Procedure)
- Software as a Medical Device (SaMD) or Software in a Medical Device (SiMD)
- General-purpose productivity tools (e.g., email, word processing) not directly impacting QMS integrity

The validation approach is **risk-based and proportionate** to the intended use and criticality of the software.

### 1.3 Responsibilities

| Role | Responsibilities |
|------|------------------|
| **Validation Owner** | Initiates validation, defines intended use, leads validation activities, compiles validation summary |
| **Quality/Regulatory** | Reviews and approves validation approach, risk assessment, and validation summary; ensures compliance with ISO 13485 |
| **IT/Infrastructure** | Provides technical input on software configuration, supports test execution, implements configuration controls |
| **Test Executor(s)** | Executes test protocols, collects evidence, documents results |
| **Approver** | Approves completed validation (typically Quality/Regulatory Lead or delegate) |

**Independence Requirement:** Validation activities should be performed by qualified personnel. Test execution should be performed by someone other than the software configurator where practical. Approval must be independent of validation execution.

### 1.4 Reference Standards, Regulations or Guides
- **ISO 13485:2016, Clause 4.1.6** — Computer software validation
- **ISO 13485:2016, Clause 7.5.6** — Validation of processes for production and service provision
- **GAMP 5** — Good Automated Manufacturing Practice Guide (informative, for risk-based approach)
- **EU MDR 2017/745, Annex I, Section 17.4** — Electronic systems validation (where applicable)

### 1.5 Reference Documents
- Process Risk Management Procedure
- Change Control Procedure
- Document and Record Control Procedure
- IT Infrastructure Management Procedure
- Software Inventory (`qms/00_index/SOFTWARE-INVENTORY.md`)
- Purchasing and Supplier Evaluation Procedure (for SaaS suppliers)

## 2. Terminology

| Term | Definition |
|------|------------|
| **Non-Product Software** | Software used in QMS operations but not intended as a medical device or component thereof |
| **Validation** | Confirmation through objective evidence that software is capable of consistently fulfilling its intended use |
| **Intended Use** | The purpose and scope for which software is used within the QMS |
| **Critical Function** | A software function whose failure would impact data integrity, document control, traceability, or regulatory compliance |
| **Risk-Based Validation** | Validation approach where scope and depth are proportionate to the risk of software failure on QMS integrity |
| **Residual Risk** | Risk remaining after implementation of mitigation controls |
| **Revalidation** | Repeat validation or partial validation following changes that may affect software performance or intended use |
| **SaaS** | Software as a Service — cloud-hosted software accessed via internet |
| **Verification** | Testing or inspection to confirm software functions operate as intended |
| **Validation Summary** | Document summarizing validation activities, results, and conclusion |

## 3. Procedure

### 3.1 Validation Workflow Overview

Non-product software validation follows a risk-based, function-oriented approach:

```
1. Software Identification → 2. Intended Use → 3. Risk Assessment → 
4. Risk Classification → 5. Control Identification → 6. Validation Planning → 
7. Test Execution → 8. Residual Risk Evaluation → 9. Validation Approval → 
10. Ongoing Monitoring
```

Validation scope and depth are proportionate to software criticality and risk to QMS integrity.

---

### 3.2 Step 1: Software Identification and Inventory

**Objective:** Identify non-product software requiring validation and update Software Inventory.

**Activities:**
1. **Identify the software:**
   - Software name and version
   - Vendor/supplier (for commercial or SaaS software)
   - Type: Commercial off-the-shelf (COTS), SaaS, internally developed, configured system
   - Deployment context: How and where is it used in QMS operations?

2. **Update Software Inventory:**
   - Add entry to Software Inventory (`qms/00_index/SOFTWARE-INVENTORY.md`)
   - Include: Name, Version, Type (Non-product), Classification (N/A), Purpose, Validation Status (Under Validation)
   - Assign owner responsible for validation

3. **Determine if validation is required:**
   - **Yes, if:** Software impacts data integrity, document control, traceability, quality records, or regulatory compliance
   - **No, if:** General productivity tool with no direct impact on QMS integrity (document rationale)

**Output:** Software identified and registered in inventory with validation owner assigned.

---

### 3.3 Step 2: Intended Use Definition

**Objective:** Clearly define how the software is used and its boundaries within the QMS.

**Activities:**
1. **Document intended use:**
   - **Purpose:** What QMS activities does the software support?
   - **Users:** Who uses the software and in what roles?
   - **Critical functions:** What functions are essential for QMS integrity?
   - **System boundaries:** What is in scope and out of scope for validation?

2. **Define operational context:**
   - Integration with other systems (if any)
   - Data inputs and outputs
   - Infrastructure requirements
   - Access control requirements

**Output:** System Description document defining intended use and boundaries.

---

### 3.4 Step 3: Risk Assessment

**Objective:** Identify potential failure modes and assess their impact on QMS integrity **before controls are implemented**.

#### 3.4.1 Risk Identification

Identify risks using the following categories:
- **Data integrity risk:** Loss, corruption, or unauthorized modification of quality data or records
- **Document control risk:** Loss of version control, unauthorized changes, inability to demonstrate document history
- **Traceability risk:** Loss of audit trail, inability to trace decisions or approvals
- **Access control risk:** Unauthorized access to QMS data or functions
- **Availability risk:** Inability to access QMS when needed for operations or audits
- **Compliance risk:** Failure to meet regulatory requirements (ISO 13485, MDR, etc.)

#### 3.4.2 Initial Risk Assessment (Before Controls)

For each identified risk, assess **initial risk level** based on:

**Impact Severity (on QMS integrity):**
- **Critical:** Catastrophic impact on QMS (e.g., complete loss of quality records, inability to demonstrate compliance)
- **High:** Major impact (e.g., loss of document version control, audit trail gaps)
- **Medium:** Moderate impact (e.g., temporary data unavailability, inconsistent metadata)
- **Low:** Minor impact (e.g., cosmetic issues, non-critical workflow inefficiencies)

**Likelihood (without controls):**
- **High:** Likely to occur without preventive measures (e.g., no technical enforcement)
- **Medium:** Possible but not frequent without controls
- **Low:** Unlikely even without specific controls (e.g., protected by inherent system design)

**Initial Risk Level Matrix:**

| Impact / Likelihood | High Likelihood | Medium Likelihood | Low Likelihood |
|---------------------|----------------|-------------------|----------------|
| **Critical Impact** | **Critical Risk** | **High Risk** | **High Risk** |
| **High Impact** | **High Risk** | **High Risk** | **Medium Risk** |
| **Medium Impact** | **High Risk** | **Medium Risk** | **Low Risk** |
| **Low Impact** | **Medium Risk** | **Low Risk** | **Low Risk** |

**Output:** Risk Assessment document with identified risks, impact, likelihood, and initial risk level.

---

### 3.5 Step 4: Risk Classification and Validation Approach

Based on initial risk assessment, determine validation approach:

| Initial Risk Level | Validation Approach | Verification Depth |
|-------------------|---------------------|-------------------|
| **Critical Risk** | **Full validation** with comprehensive test protocols; requires extensive controls and verification | Detailed functional testing, stress testing, documentation review |
| **High Risk** | **Structured validation** with formal test protocols for critical functions | Functional testing of critical features, control verification |
| **Medium Risk** | **Targeted validation** with test protocols for key controls | Testing focused on risk mitigation controls |
| **Low Risk** | **Documented assessment** or periodic monitoring; formal validation may not be required | Operational monitoring, periodic review |

**Principle:** Validation effort is proportionate to risk. High and Critical risks require formal validation with objective evidence.

---

### 3.6 Step 5: Control Identification and Mitigation Strategy

**Objective:** Identify technical, procedural, and organizational controls that reduce risk from initial level to acceptable residual level.

**Activities:**
1. **Identify mitigation controls** for each risk:
   - **Technical controls:** Software features, configuration settings, automated checks (e.g., branch protection, access control)
   - **Procedural controls:** Workflows, approval processes, backup procedures
   - **Organizational controls:** Training, roles and responsibilities, periodic review

2. **Define how controls reduce risk:**
   - **Reduce likelihood:** Controls prevent failure from occurring (e.g., branch protection prevents unauthorized commits)
   - **Reduce impact:** Controls limit consequences if failure occurs (e.g., backup enables recovery from data loss)

3. **Map controls to critical functions:**
   - Define critical functions that implement controls
   - Map each risk to specific critical functions that mitigate it

**Output:** Control mapping document showing Risk → Control → Critical Function linkage.

---

### 3.7 Step 6: Validation Planning

**Objective:** Define validation scope, test protocols, and acceptance criteria based on risk and controls.

#### 3.7.1 Validation Plan Content

The validation plan includes:
1. **Validation scope:** Which critical functions require verification
2. **Test protocols:** Specific tests for each critical function
3. **Acceptance criteria:** Pass/fail criteria for validation
4. **Roles and responsibilities:** Who executes, reviews, approves
5. **Deviation management:** How deviations are handled
6. **Evidence requirements:** What evidence will be collected

#### 3.7.2 Test Protocol Development

For each critical function requiring verification, develop a test protocol:

**Test Protocol Structure:**
- **Objective:** What is being verified
- **Preconditions:** System state before testing
- **Test steps:** Specific actions to perform
- **Expected results:** What constitutes successful verification
- **Pass criteria:** Clear pass/fail determination
- **Evidence to collect:** Screenshots, logs, configuration exports

**Test Protocol Coverage:**
- All High and Critical risks must have corresponding test protocols
- Medium risks may have targeted test protocols or documented verification
- Low risks may rely on operational monitoring

#### 3.7.3 Supplier Assessment (for SaaS and COTS)

If software is provided by external supplier:
- Conduct supplier assessment per Purchasing and Supplier Evaluation Procedure
- Review supplier certifications (ISO 27001, SOC 2, etc.)
- Assess supplier reliability, security, and regulatory compliance
- Document supplier risk and mitigation measures

**Output:** Validation Plan, Test Protocols, and Supplier Assessment (if applicable).

---

### 3.8 Step 7: Test Execution and Evidence Collection

**Objective:** Execute test protocols and collect objective evidence of successful verification.

**Activities:**
1. **Prepare test environment:**
   - Ensure software is configured as intended for operational use
   - Validation should be performed on actual operational configuration (not separate test environment) or a representative configuration

2. **Execute test protocols:**
   - Follow test steps precisely as documented
   - Record observations and results
   - Collect evidence: screenshots, command outputs, configuration exports, logs
   - Document test execution using Test Execution Record template

3. **Manage deviations:**
   - If test results differ from expected:
     - Document deviation in Deviation Log
     - Classify severity: Critical, Major, Minor
     - Investigate root cause
     - Determine resolution: corrective action, retest, or risk acceptance with justification
   - Critical deviations must be resolved before validation approval
   - Major deviations require corrective action or documented risk acceptance
   - Minor deviations may be accepted with justification

4. **Evidence storage:**
   - Store evidence artifacts in validation documentation folder
   - Ensure evidence is sufficient for audit and inspection review
   - Link evidence to test protocols and test execution records

**Output:** Completed Test Execution Records, evidence artifacts, Deviation Log (if applicable).

---

### 3.9 Step 8: Residual Risk Evaluation

**Objective:** Assess residual risk after controls are implemented and verified, and determine if risk is acceptable.

#### 3.9.1 Residual Risk Assessment

For each identified risk:
1. **Review control effectiveness:**
   - Were controls verified through test protocols?
   - Did tests demonstrate controls function as intended?

2. **Determine residual risk:**
   - **Likelihood after controls:** Has likelihood been reduced by controls?
   - **Impact after controls:** Has impact been reduced or contained?
   - **Residual risk level:** Re-assess risk level with controls in place

**Residual Risk Acceptance Criteria:**

| Residual Risk Level | Acceptability | Requirement |
|---------------------|---------------|-------------|
| **Critical** | **Not acceptable** | Must implement additional controls; validation cannot be approved |
| **High** | **Generally not acceptable** | Requires documented justification and management approval; additional controls preferred |
| **Medium** | **Acceptable with justification** | Document rationale for acceptance; ensure monitoring in place |
| **Low** | **Acceptable** | Risk is acceptable for QMS operations; document assessment |

**Output:** Residual risk assessment for all identified risks, documented in Validation Summary.

---

### 3.10 Step 9: Validation Summary and Approval

**Objective:** Compile validation summary demonstrating software is validated and approved for use.

#### 3.10.1 Validation Summary Report

The Validation Summary includes:
1. **Executive summary:** Validation objective and outcome
2. **System information:** Software validated, version, configuration
3. **Validation scope:** Critical functions verified
4. **Test execution summary:** Test protocols executed, pass/fail results
5. **Deviations summary:** Deviations identified and resolution status
6. **Risk assessment:** Initial risks, controls, residual risks, acceptance rationale
7. **Validation conclusion:** Statement of validation status
8. **Approval records:** Signatures/approvals of reviewers and approvers

#### 3.10.2 Validation Acceptance Criteria

Validation is successful when:
- All test protocols for critical functions achieved "Pass" status
- All critical deviations resolved
- Major deviations resolved or accepted with documented justification
- Residual risks assessed as acceptable
- Evidence sufficient for regulatory audit
- Validation summary reviewed and approved by Quality/Regulatory

#### 3.10.3 Approval Process

1. **Review:** Validation Owner compiles validation summary; Quality/Regulatory reviews
2. **Approval:** Quality/Regulatory (or delegate) approves validation summary
3. **Effective date:** Validation becomes effective upon approval (e.g., Pull Request merge date in Git-native eQMS)
4. **Communication:** Inform stakeholders that software is validated and approved for use
5. **Inventory update:** Update Software Inventory to reflect "Validated" status

**Output:** Approved Validation Summary Report; software approved for operational use.

---

### 3.11 Step 10: Ongoing Monitoring and Revalidation

**Objective:** Ensure validated software continues to fulfill intended use and remains under control.

#### 3.11.1 Operational Monitoring

1. **Periodic verification:**
   - Verify critical configuration remains as validated (e.g., quarterly)
   - Monitor software performance and incidents
   - Review during internal audits

2. **Incident management:**
   - Quality events indicating software control failure trigger investigation
   - Assess impact on validation status
   - Implement corrective action and revalidate if needed

#### 3.11.2 Revalidation Triggers

Revalidation is required when:

| Trigger | Revalidation Scope | Assessment Requirement |
|---------|-------------------|----------------------|
| **Configuration change** | Targeted or full, depending on change impact | Document change; assess impact on validated functions; revalidate affected controls |
| **Software version change** | Targeted revalidation of affected functions | Review release notes; assess impact on critical functions; retest if functionality changes |
| **Workflow or process change** | Targeted revalidation | Assess impact on intended use; revalidate if workflow critical to control |
| **Supplier change** | Supplier reassessment; may require revalidation | Conduct new supplier assessment; assess continuity of controls |
| **Infrastructure migration** | Full or targeted revalidation | Document migration; verify critical functions in new environment |
| **Quality event** | Investigation-driven revalidation | Root cause analysis; revalidate affected controls; implement corrective action |
| **Periodic review identifies gaps** | Targeted revalidation | Address identified gaps; revalidate as needed |

#### 3.11.3 Revalidation Process

1. **Change assessment:**
   - Document change and rationale
   - Assess impact on validated functions and risks
   - Determine revalidation scope: None / Targeted / Full

2. **Revalidation execution (if required):**
   - Update validation documentation (if needed)
   - Re-execute affected test protocols
   - Collect evidence
   - Compile revalidation summary

3. **Revalidation approval:**
   - Review and approve revalidation summary
   - Update Software Inventory validation status

**Output:** Revalidation assessment and summary (if revalidation executed).

---

### 3.12 Documentation Structure

All validation activities are documented in a structured validation documentation package:

```
qms/06_records/software-validation/[software-name]/
├── README.md                              # Overview and status
├── System-Description-and-Intended-Use.md # Intended use definition
├── Risk-Assessment.md                     # Risk identification and assessment
├── Validation-Plan.md                     # Validation approach and scope
├── Supplier-Assessment.md                 # Supplier evaluation (if applicable)
├── Backup-Strategy.md                     # Backup and continuity (if applicable)
├── Critical-Functions-and-Controls.md     # Control mapping
├── Traceability-Matrix.md                 # Risk → Control → Test traceability
├── Test-Protocols/                        # Folder with test protocol files
├── Test-Execution-Templates/              # Test execution records and deviation log
├── Validation-Summary-Report.md           # Final validation summary
└── Revalidation-Plan.md                   # Revalidation triggers and approach
```

This structure ensures complete traceability and auditability.

## 4. Records

The following records are generated and maintained as evidence of non-product software validation:

| Record | Description | Location |
|--------|-------------|----------|
| **Software Inventory** | List of all non-product software with validation status | `qms/00_index/SOFTWARE-INVENTORY.md` |
| **System Description** | Intended use and boundaries of software | Validation documentation folder |
| **Risk Assessment** | Identification and assessment of risks (initial and residual) | Validation documentation folder |
| **Validation Plan** | Validation approach, scope, and acceptance criteria | Validation documentation folder |
| **Supplier Assessment** | Evaluation of external software suppliers (if applicable) | Validation documentation folder or supplier records folder |
| **Critical Functions and Controls** | Mapping of risks to controls and critical functions | Validation documentation folder |
| **Traceability Matrix** | Risk → Control → Test Protocol traceability | Validation documentation folder |
| **Test Protocols** | Detailed test procedures for critical functions | Validation documentation folder |
| **Test Execution Records** | Results of test execution with evidence | Validation documentation folder |
| **Deviation Log** | Deviations from expected results and their resolution | Validation documentation folder |
| **Validation Summary Report** | Final summary with validation conclusion and approval | Validation documentation folder |
| **Revalidation Records** | Change assessments and revalidation summaries | Validation documentation folder (revalidation subfolder) |
| **Configuration Verification Records** | Periodic verification of critical configuration | Validation documentation folder or internal audit records |

All validation records are maintained under document control per the Document and Record Control Procedure.

## 5. Retention

Validation records are retained according to the following requirements:

| Record Type | Retention Period | Rationale |
|-------------|-----------------|-----------|
| **Validation Summary Reports** | Duration of software use + minimum 10 years after software retirement or decommissioning | ISO 13485:2016 record retention requirements; regulatory inspection availability |
| **Test Protocols and Execution Records** | Duration of software use + minimum 10 years | Evidence of validation must be available for regulatory inspections |
| **Risk Assessments** | Duration of software use + minimum 10 years | Demonstrates risk-based approach and decision rationale |
| **Revalidation Records** | Duration of software use + minimum 10 years | Demonstrates ongoing control and change management |
| **Configuration Verification Records** | Minimum 5 years or until superseded by revalidation | Demonstrates operational monitoring |
| **Software Inventory** | Duration of QMS operation + 10 years | Master record of all software used |

**Retention Location:**
- Validation records are stored in the Git-native eQMS repository under `qms/06_records/software-validation/`
- Historical versions are preserved through Git version control
- Backup of repository ensures long-term preservation (see Backup and Continuity Strategy)

**Retirement:**
When software is retired or decommissioned:
1. Update Software Inventory to mark software as "Retired" or "Obsolete"
2. Archive validation documentation to `qms/99_archive/software-validation/` (optional, or retain in place with status update)
3. Retain all validation records for minimum retention period
4. Document retirement date and rationale

## 6. Access Control

Access to validation records is controlled to ensure confidentiality, integrity, and availability.

### 6.1 Access Permissions

| Role | Read Access | Write/Edit Access | Approval Rights | Rationale |
|------|-------------|------------------|----------------|-----------|
| **Quality/Regulatory** | Full access to all validation records | Can create and edit validation documentation | Can approve validation summaries | Responsible for validation oversight and compliance |
| **Validation Owner** | Full access to assigned validation documentation | Can create and edit assigned validation records | Cannot approve own validations | Leads validation activities; independence requirement for approval |
| **Test Executors** | Access to test protocols and execution templates | Can document test execution results | No approval rights | Executes tests and collects evidence |
| **IT/Infrastructure** | Access to technical validation records | Can contribute technical input | No approval rights | Provides technical expertise and configuration support |
| **Auditors (Internal/External)** | Read-only access to all validation records | No edit access | No approval rights | Requires access for audit and inspection activities |
| **Management** | Read access to validation summaries | No edit access | May have approval rights per organizational policy | Oversight and review responsibilities |

### 6.2 Change Control for Validation Records

All changes to validation records are managed through the Change Control Procedure:
- Proposed changes are documented with rationale
- Changes are reviewed and approved before becoming effective
- Change history is preserved (via Git version control in Git-native eQMS)
- Significant changes may trigger revalidation assessment

### 6.3 Confidentiality

Validation records may contain:
- Proprietary configuration information
- Supplier confidential information (e.g., SOC 2 reports)
- Security-sensitive details (e.g., access control configuration)

Access is restricted to authorized personnel only. External sharing requires review and approval per organizational information security policy.

### 6.4 Availability for Inspection

Validation records must be readily available for:
- Internal audits
- External audits (ISO 13485 certification audits, Notified Body audits)
- Regulatory inspections (FDA, competent authorities)

The validation documentation structure ensures records are organized, traceable, and audit-ready.

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

It is shared under the terms of the Apache License, Version 2.0.
You may use, modify, and distribute this document in accordance with the License.

This template provides structure only. Regulatory compliance depends on proper implementation
by the organization.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
