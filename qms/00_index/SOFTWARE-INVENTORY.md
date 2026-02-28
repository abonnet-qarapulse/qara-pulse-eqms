---
doc_id: TBD
title: "Software Inventory"
doc_type: "Index"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Software Inventory

## Purpose

This document provides an inventory of all software components used within the organization, including Software as a Medical Device (SaMD), Software in a Medical Device (SiMD), and non-product software applications used in QMS activities.

The software inventory supports:
- software lifecycle management and traceability,
- cybersecurity and vulnerability management,
- regulatory compliance and documentation,
- software validation and verification activities,
- audit and inspection activities.

---

## Scope

This inventory includes:
- Software as a Medical Device (SaMD) products
- Software components integrated into medical devices (SiMD)
- Non-product software applications used in QMS activities (development tools, infrastructure software, etc.)
- Software libraries, frameworks, and third-party components
- Open-source software components

The inventory reflects the current state of software assets used by the organization. This document should be updated whenever software components are added, removed, or modified to maintain accuracy and completeness.

---

## Software Inventory

| Software Name | Version | Type | Classification | Purpose/Function | Validation Status | Owner | Notes |
|--------------|---------|------|----------------|------------------|-------------------|-------|-------|
| GitHub | SaaS (GitHub.com) | Non-product | N/A | Git repository hosting platform for eQMS document control, access control, audit trail, and collaborative workflows | Under Validation | TBD | Part of Git-native eQMS infrastructure. Validation dossier: `qms/06_records/software-validation/eQMS-git-native/` |
| Git | TBD | Non-product | N/A | Distributed version control system used for document versioning, change tracking, and audit trail | Under Validation | TBD | Core component of Git-native eQMS. Validation dossier: `qms/06_records/software-validation/eQMS-git-native/` |
| GitHub Pull Requests | Native to GitHub | Non-product | N/A | Change control workflow mechanism for proposing, reviewing, and approving QMS document changes | Under Validation | TBD | Implements formal change control process. Validation dossier: `qms/06_records/software-validation/eQMS-git-native/` |
| GitHub CODEOWNERS | Native to GitHub | Non-product | N/A | Approval authority mechanism defining who is authorized to approve changes to specific QMS documents | Under Validation | TBD | Enforces separation of duties and approval matrix. Validation dossier: `qms/06_records/software-validation/eQMS-git-native/` |
| GitHub Branch Protection Rules | Native to GitHub | Non-product | N/A | Technical enforcement of quality rules (mandatory PRs, required reviews, status checks) to prevent unauthorized changes to controlled documents | Under Validation | TBD | Technical control for quality enforcement. Validation dossier: `qms/06_records/software-validation/eQMS-git-native/` |
| GitHub Actions | Native to GitHub | Non-product | N/A | CI/CD platform for automated quality gates, document validation, metadata checks, and consistency verification | Under Validation | TBD | Automated quality checks and validation. Validation dossier: `qms/06_records/software-validation/eQMS-git-native/` |
| Markdown Editor (local) | TBD | Non-product | N/A | Text editor used by personnel to create and edit QMS documents in Markdown format | Not Validated | TBD | Standard text editing tool; validation not required per risk assessment |
| Git Repository Backup | TBD | Non-product | N/A | Backup mechanism for eQMS repository (e.g., git clone --mirror, GitHub backup service, or equivalent) | Not Validated | TBD | Backup and disaster recovery; validation requirements TBD based on backup solution implemented |

**Legend:**
- **Type**: SaMD (Software as a Medical Device), SiMD (Software in a Medical Device), Non-product (software used in QMS but not a medical device)
- **Classification**: Risk class for SaMD/SiMD (Class I, IIa, IIb, III), or "N/A" for non-product software
- **Validation Status**: Status of software validation (Validated, Under Validation, Not Validated)

---

## Maintenance

This inventory can be maintained manually or generated automatically through scripts that scan software repositories and deployment environments. Organizations may implement automated generation to ensure the inventory stays synchronized with the actual software assets.

Changes to this inventory are managed through the **Change Control Procedure** and should be reviewed as part of the **Configuration Management Procedure** and **SDLC Procedure**.

---

## Related QMS Documents

- SDLC Procedure
- Configuration Management Procedure
- Non-Product Software Application Validation Procedure
- Change Control Procedure
- IT Infrastructure Management Procedure
- Cybersecurity Management Procedure

---

## Status

This document is maintained under document control and forms part of the Quality Management System.

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

It is shared under the terms of the Apache License, Version 2.0.
You may use, modify, and distribute this document in accordance with the License.

This template provides structure only. Regulatory compliance depends on proper implementation
by the organization.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*