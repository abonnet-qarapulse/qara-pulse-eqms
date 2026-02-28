---
doc_id: VAL-EQMS-GIT-01
title: "Git-native eQMS System Description and Intended Use"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Git-native eQMS System Description and Intended Use

## Purpose

This document describes the Git-native electronic Quality Management System (eQMS) configuration, its architecture, components, and intended use within the organization's QMS operations.

---

## System Overview

The Git-native eQMS is a document control and quality management infrastructure built on Git version control and GitHub platform capabilities. It replaces traditional document management systems with a software development workflow adapted for regulatory documentation.

**Core Principle:** Quality documentation is managed as versioned source material, with change control enforced through technical mechanisms and Git-native workflows.

---

## System Components

| Component | Type | Function |
|-----------|------|----------|
| **Git** | Local/distributed version control system | Document versioning, change tracking, audit trail generation |
| **GitHub** | SaaS platform | Repository hosting, collaboration, access control, workflow automation |
| **GitHub Pull Requests** | Workflow mechanism | Formal change proposal, review, and approval process |
| **GitHub CODEOWNERS** | Authorization mechanism | Defines approval authority for specific documents or document categories |
| **GitHub Branch Protection Rules** | Technical control | Enforces quality rules (mandatory reviews, PR workflow, status checks) |
| **GitHub Actions** | CI/CD platform | Automated validation, quality gates, consistency checks |
| **Markdown** | Document format | Human-readable, version-controllable, structured documentation format |
| **YAML metadata headers** | Document identification | Structured metadata for document ID, version, owner, status |

---

## System Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         GitHub Platform                          │
│  (Repository Hosting, Access Control, Collaboration)            │
└──────────────────────────────┬──────────────────────────────────┘
                               │
        ┌──────────────────────┼──────────────────────┐
        │                      │                      │
┌───────▼────────┐   ┌────────▼─────────┐   ┌───────▼────────┐
│  Git Version   │   │  GitHub Actions  │   │ Branch         │
│  Control       │   │  (CI/CD)         │   │ Protection     │
│  (Local + Remote)  │  Quality Gates   │   │ Rules          │
└───────┬────────┘   └────────┬─────────┘   └───────┬────────┘
        │                      │                      │
        └──────────────────────┼──────────────────────┘
                               │
                  ┌────────────▼────────────┐
                  │   Pull Request          │
                  │   Workflow              │
                  │   (Change Control)      │
                  └────────────┬────────────┘
                               │
                  ┌────────────▼────────────┐
                  │   CODEOWNERS            │
                  │   (Approval Authority)  │
                  └─────────────────────────┘
```

---

## Intended Use

The Git-native eQMS is intended for:

1. **Document Control**
   - Version control of QMS documents (policies, procedures, work instructions, templates)
   - Unique document identification through YAML metadata
   - Document status management (Draft, Effective, Obsolete)

2. **Change Control**
   - Formal proposal of changes through Pull Requests
   - Documented rationale and impact analysis for each change
   - Review and approval workflow with traceability

3. **Access Control and Authorization**
   - Role-based access control through GitHub teams and permissions
   - Approval authority definition through CODEOWNERS
   - Technical enforcement of authorization rules

4. **Audit Trail**
   - Complete history of who changed what, when, and why
   - Review and approval records preserved in Git history
   - Immutable, cryptographically signed commit history

5. **Quality Enforcement**
   - Prevention of unauthorized changes through branch protection
   - Mandatory peer review before document becomes effective
   - Automated validation of document structure and metadata

6. **Traceability**
   - Linking changes to change requests, issues, or rationale
   - Cross-referencing related documents
   - Change impact analysis and dependency tracking

---

## System Boundaries

### In Scope

- Document control for QMS documentation (governance, processes, procedures, templates)
- Change control workflow and approval mechanisms
- Access control and authorization
- Audit trail generation and preservation
- Technical enforcement of quality rules

### Out of Scope

- Product software development (covered by SDLC Procedure)
- Electronic signatures (GitHub reviews serve as approval records, not electronic signatures per 21 CFR Part 11)
- Real-time collaboration during document editing (editing occurs locally, collaboration occurs during review)
- Training records management (managed separately in QMS records)
- CAPA workflow execution (CAPA records tracked separately, process may reference Git workflow)

---

## User Roles

| Role | GitHub Permission Level | Responsibilities |
|------|------------------------|------------------|
| **Quality/Regulatory** | Write + CODEOWNER | Approve changes to procedures, governance documents |
| **Top Management** | Write + CODEOWNER | Approve strategic documents (Quality Manual, policies, objectives) |
| **Document Authors** | Write | Create and propose changes to QMS documents |
| **Reviewers** | Read + Review | Review proposed changes, provide feedback |
| **Auditors/Viewers** | Read | View current and historical QMS documentation |

---

## Operational Context

The Git-native eQMS operates within the following organizational context:

- **Organization Type:** Medical device manufacturers (SaMD, AIaMD, digital health)
- **Regulatory Environment:** ISO 13485, EU MDR, FDA 21 CFR Part 820
- **Team Structure:** Tech-led organizations comfortable with software development workflows
- **Infrastructure:** GitHub SaaS platform (GitHub.com) or GitHub Enterprise

---

## Critical Success Factors

For the Git-native eQMS to fulfill its intended use, the following must be ensured:

1. **Technical Configuration:**
   - Branch protection rules correctly configured
   - CODEOWNERS file accurately defines approval authority
   - CI/CD quality gates operational

2. **Personnel Competence:**
   - Users trained in Git/GitHub workflow
   - Quality roles understand mapping between Git mechanisms and QMS concepts

3. **Process Integration:**
   - Change Control Procedure references Pull Request workflow
   - Document and Record Control Procedure defines Git-native mechanisms

4. **Infrastructure Reliability:**
   - GitHub platform availability
   - Backup strategy implemented and tested
   - Access control properly configured

---

## System Lifecycle

| Lifecycle Phase | Activities |
|----------------|-----------|
| **Planning** | Define validation approach, identify critical functions, assess risks |
| **Configuration** | Set up repository, branch protection, CODEOWNERS, CI/CD |
| **Validation** | Execute test protocols, collect evidence, document results |
| **Operation** | Daily QMS operations through Git workflow |
| **Monitoring** | Periodic review of configuration, audit trail verification |
| **Revalidation** | Triggered by configuration changes or periodic review |
| **Retirement** | Migration to new system, archive preserved as audit trail |

---

## Related QMS Documents

- Software Inventory
- Non-Product Software Application Validation Procedure
- Document and Record Control Procedure
- Change Control Procedure
- Configuration Management Procedure

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
