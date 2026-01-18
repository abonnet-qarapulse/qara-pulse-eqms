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
| {{software name}} | {{version}} | {{SaMD/SiMD/Non-product}} | {{classification}} | {{purpose}} | {{validated/under validation}} | {{owner}} | {{notes}} |

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