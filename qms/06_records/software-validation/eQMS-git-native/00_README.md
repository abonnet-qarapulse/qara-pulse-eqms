---
doc_id: VAL-EQMS-GIT-00
title: "Git-native eQMS Validation Dossier - README"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Git-native eQMS Validation Dossier - README

## Purpose

This folder contains the validation dossier for the Git-native electronic Quality Management System (eQMS) configuration used by the organization.

The validation is performed in accordance with:
- **ISO 13485:2016 Clause 4.1.6** — Validation of software used in the quality management system
- **Non-Product Software Application Validation Procedure**
- Risk-based validation principles proportionate to the intended use and risks

The validation demonstrates that the Git-native eQMS configuration is capable of consistently fulfilling its intended use for:
- Document and record control
- Change control and approval workflows
- Access control and authorization
- Audit trail generation and preservation
- Quality enforcement through technical controls

---

## Scope

This validation dossier covers the following software components and mechanisms used to operate the Git-native eQMS:

1. **GitHub** — Repository hosting platform (SaaS)
2. **Git** — Distributed version control system
3. **GitHub Pull Requests** — Change control workflow mechanism
4. **GitHub CODEOWNERS** — Approval authority assignment
5. **GitHub Branch Protection Rules** — Technical enforcement of quality rules
6. **GitHub Actions** — Automated quality gates and checks

The validation focuses on critical functions that impact QMS document control, traceability, and regulatory compliance.

---

## Validation Dossier Structure

| File | Description |
|------|-------------|
| `01_System-Description-and-Intended-Use.md` | Description of the Git-native eQMS system and its intended use |
| `02_Risk-Assessment.md` | Risk assessment identifying potential failures and their impact |
| `03_Validation-Plan.md` | Risk-based validation approach and acceptance criteria |
| `04_Supplier-Assessment-GitHub.md` | Evaluation of GitHub as a SaaS supplier |
| `05_Backup-and-Continuity-Strategy.md` | Backup, restore, and continuity measures |
| `06_Critical-Functions-and-Controls.md` | Mapping of critical functions to technical controls |
| `07_Traceability-Matrix.md` | Traceability from risks to controls to test protocols |
| `08_Test-Protocols/` | Folder containing test protocols for each critical function |
| `09_Test-Execution-Templates/` | Templates for recording test execution and deviations |
| `10_Validation-Summary-Report-Template.md` | Template for final validation summary report |
| `11_Revalidation-Plan.md` | Triggers and approach for revalidation activities |

---

## Validation Status

**Current Status:** Under Validation

This dossier provides the **structure and methodology** for validation. Each organization must:

1. **Execute the test protocols** using their specific Git-native eQMS configuration
2. **Collect objective evidence** of successful test execution
3. **Document any deviations** and their resolutions
4. **Complete the validation summary report** with evidence references
5. **Obtain formal approval** through the organization's quality review process

**Disclaimer:** This dossier is provided as a template. Validation completion, evidence generation, and approval remain the responsibility of each implementing organization.

---

## Regulatory Basis

- **ISO 13485:2016, Clause 4.1.6** — Software validation requirements
- **ISO 13485:2016, Clause 4.2.4** — Control of records
- **ISO 13485:2016, Clause 4.2.5** — Control of documents
- **EU MDR 2017/745, Annex I, Section 17.4** — Electronic systems validation

---

## Document Control

This validation dossier is maintained under the organization's document control system. Changes to the validation approach, test protocols, or validation status are managed through the **Change Control Procedure**.

Revalidation may be required when:
- Critical configuration changes are made (branch protection, CODEOWNERS, CI/CD)
- Major GitHub platform updates impact core functionality
- The organization migrates repositories or changes hosting infrastructure
- Periodic review identifies gaps or non-conformities

See `11_Revalidation-Plan.md` for detailed revalidation triggers.

---

## Related QMS Documents

- Non-Product Software Application Validation Procedure
- Software Inventory (`qms/00_index/SOFTWARE-INVENTORY.md`)
- Document and Record Control Procedure
- Change Control Procedure
- Configuration Management Procedure

---

This validation dossier is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

It is shared under the terms of the Apache License, Version 2.0.
You may use, modify, and distribute this documentation in accordance with the License.

This template provides structure only. Regulatory compliance depends on proper execution and evidence collection by the organization.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
