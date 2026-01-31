![QARA PULSE Banner](assets/qara-pulse-banner.png)

# Git-native eQMS Framework

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

**Open-source Quality Management System infrastructure for SaMD & AI medical devices**

A Git-native, audit-ready Quality Management System framework designed for software and AI medical devices.
Built for teams who want regulatory compliance to be structured, traceable, and scalable by design.

---

## 📋 Table of Contents

- [What This Is](#what-this-is)
- [Who This Is For](#who-this-is-for)
- [What This Is Not](#what-this-is-not)
- [Features](#features)
- [Key Principles](#key-principles)
- [Getting Started](#getting-started)
- [How It Works](#how-it-works)
  - [Document Control Workflow](#document-control-workflow)
  - [How GitHub Maps to QMS Concepts](#how-github-maps-to-qms-concepts)
  - [Regulatory Alignment](#regulatory-alignment-indicative)
- [Repository Structure](#repository-structure)
- [Contributing](#contributing)
- [Support](#support)
- [About QARA PULSE](#about-qara-pulse)
- [Open Core Philosophy](#open-core-philosophy)
- [License](#license)
- [Disclaimer](#disclaimer)

---

## What This Is

This repository provides an open-source, Git-based eQMS foundation for organizations developing:

- Software as a Medical Device (SaMD)
- AI as a Medical Device (AIaMD)
- Digital health products under ISO 13485 and EU MDR

It delivers a production-grade QMS structure, designed to be managed like software: versioned, reviewed, traceable, and auditable through Git workflows.

**This is not a QMS SaaS tool.**
**It is QMS as infrastructure.**

## Who This Is For

This framework is intended for:

- Digital health and medtech teams building regulated software products
- Tech-led organizations comfortable with Git-based workflows
- Startups and scale-ups preparing for ISO 13485 certification and CE marking
- Teams seeking audit-ready document control without heavyweight QMS tools

It assumes internal ownership of Quality and Regulatory responsibilities.

## What This Is Not

- Not a "plug-and-play" certified QMS
- Not a replacement for Quality or Regulatory expertise
- Not suitable for non-software medical devices
- Not a guarantee of compliance without proper customization and governance

## Features

✅ **Complete QMS document structure** — Policies, procedures, templates, and records  
✅ **ISO 13485 and EU MDR–aligned** — Regulatory compliance by design  
✅ **Git-native document control** — Version control, traceability, and audit trails  
✅ **Pull Request–based change management** — Formal review and approval workflows  
✅ **CODEOWNERS-driven governance** — Automated review assignments  
✅ **CI/CD-ready quality gates** — Automated validation and consistency checks  
✅ **Standardized YAML metadata** — Consistent document identification  
✅ **Template-based content** — Fully customizable procedures and templates  
✅ **MDR Technical Documentation starter** — Annex II & III folder structure for product-specific evidence  
✅ **Clear setup guidance** — Step-by-step instantiation checklist

## Key Principles

- **QMS as Code** — Quality documentation is managed as versioned source material.
- **Change Control via Pull Requests** — Reviews, approvals, and rationales are formalized through Git workflows.
- **Audit Trail by Design** — History, authorship, approvals, and changes are preserved in Git.
- **Structure Before Content** — A strong system architecture enables compliant, scalable execution.

## Getting Started

### Prerequisites

- A GitHub account
- Basic familiarity with Git and GitHub workflows
- Understanding of ISO 13485 / EU MDR requirements (for medical devices)
- Python 3.x (optional, for automation scripts)

### Quick Start

1. **Use this template** — Click "Use this template" on GitHub to create your repository
2. **Follow the checklist** — Start with [`INSTANTIATION-CHECKLIST.md`](INSTANTIATION-CHECKLIST.md)
3. **Customize your QMS** — Replace placeholders, customize procedures, configure roles
4. **Set up governance** — Configure GitHub branch protection, CODEOWNERS, and review requirements
5. **Begin operations** — Start managing your QMS through Pull Requests

### Detailed Setup

For complete setup instructions, see the [Instantiation Checklist](INSTANTIATION-CHECKLIST.md). The checklist covers:

- Company and leadership information replacement
- GitHub configuration (CODEOWNERS, branch protection)
- Document metadata updates
- Template customization
- Quality gates configuration

## How It Works

### Document Control Workflow

```
1. Create/Edit     →  Documents are created or updated on a feature branch
2. Propose        →  Changes are proposed through a Pull Request
3. Review         →  Review and approval are enforced via CODEOWNERS
4. Approve        →  Merging into main makes the document effective
5. Trace          →  Full traceability is preserved in Git history
```

### How GitHub Maps to QMS Concepts

This system relies on clear equivalences between GitHub mechanisms and QMS requirements.

**Repository = Quality Management System**

The Git repository is the single source of truth for the QMS.  
If it is not in Git, it does not exist.

**Markdown files = Controlled documents**

Each QMS document is a versioned Markdown file. Document control is ensured through:
- Git versioning
- Structured metadata (YAML header)
- Controlled change workflows

Manual version tables and signature pages are intentionally removed.

**YAML header = Document identification**

Each controlled document contains a YAML header defining:
- document ID
- version
- status
- owner
- scope

This replaces traditional cover pages and enables automation.

**Pull Requests = Change Control**

Every change to the QMS is made through a Pull Request. A Pull Request represents:
- the proposed change
- its rationale
- its impact analysis
- and its approval

One Pull Request = one quality decision.

**GitHub Reviews = Approvals**

Reviews performed in GitHub constitute formal approvals:
- Reviewer identity = approver identity
- Review timestamp = approval date
- Review record = approval evidence

**CODEOWNERS = Approval authority**

The CODEOWNERS file defines who is authorized to approve what. Examples:
- procedures approved by QARA
- governance documents approved by Top Management

If the required CODEOWNER does not approve, the change cannot be merged.

**Branch protection rules = Quality enforcement**

Branch protection rules enforce quality rules technically:
- no direct commits on main
- mandatory Pull Requests
- mandatory reviews
- mandatory CI checks

This ensures separation of duties by design.

**CI / Quality Gates = Automated checks**

GitHub Actions can be used to:
- validate document metadata
- ensure indexes are up to date
- prevent inconsistent or incomplete documentation

A non-compliant change simply cannot be merged.

**Merge to main = Entry into force**

Merging a Pull Request into main makes the change effective.  
The merge timestamp is considered the effective date of the document.

**Git history = Audit trail**

Git provides the complete audit trail:
- who changed what
- when
- why
- with whose approval

No separate change logs are required.

---

### Regulatory Alignment (Indicative)

- **ISO 13485** — Document and record control, quality management system requirements
- **EU MDR** — Lifecycle documentation and traceability requirements
- **IEC 62304** — Software development lifecycle integration

## Technical Documentation (EU MDR Annex II & III)

The [`technical-documentation/`](technical-documentation/) folder provides a starter structure for Technical Documentation as required by:

- **EU MDR 2017/745 — Annex II** (Technical Documentation)
- **EU MDR 2017/745 — Annex III** (Post-Market Surveillance)

This structure complements the Quality Management System under [`qms/`](qms/):

- The **QMS** defines processes, roles, and controlled rules that govern how the organization operates.
- The **Technical Documentation** contains product-specific evidence and demonstrates compliance for a given medical device.

Like the QMS, the Technical Documentation benefits from Git-native control principles:

- Changes are made via Pull Requests
- Reviews serve as approvals and signatures
- Merging to main makes the change effective and auditable

**Note:** The content is template-based and must be instantiated per product and organization.

## Repository Structure

```
.
├── technical-documentation/   # MDR Annex II & III Technical Documentation starter (product-specific evidence)
├── qms/
│   ├── 00_index/              # Indexes and system-level references
│   ├── 01_governance/         # Quality Manual, policies, objectives
│   ├── 02_processes/          # Process definitions
│   ├── 03_procedures/         # Controlled procedure templates
│   ├── 04_work-instructions/  # Operational instructions
│   ├── 05_templates/          # Document and record templates
│   ├── 06_records/            # Generated evidence
│   └── 99_archive/            # Obsolete documents
│
├── scripts/                   # Automation scripts
├── .github/
│   ├── workflows/            # CI/CD quality gates
│   └── CODEOWNERS            # Review assignments
│
├── INSTANTIATION-CHECKLIST.md
└── README.md
```

For a complete index of all QMS documents, see [`qms/00_index/SMQ-INDEX.md`](qms/00_index/SMQ-INDEX.md).

## Contributing

Contributions are welcome! This framework benefits from community input and improvements.

We welcome contributions including:
- Bug reports and fixes
- Documentation improvements
- Feature suggestions and implementations
- QMS structure enhancements

### Quick Start

1. **Fork the repository**
2. **Create a feature branch** — `git checkout -b feature/your-improvement`
3. **Make your changes** — Follow existing patterns and standards
4. **Submit a Pull Request** — Use the PR template and provide clear description

For detailed contribution guidelines, see [`CONTRIBUTING.md`](CONTRIBUTING.md).

### Reporting Issues

Found a bug or have a suggestion? Please open an [issue](https://github.com/abonnet-qarapulse/pulse-eqms-starter/issues) with:
- Clear description of the problem or suggestion
- Steps to reproduce (if applicable)
- Expected vs. actual behavior

## Support

- **Documentation** — See [`INSTANTIATION-CHECKLIST.md`](INSTANTIATION-CHECKLIST.md) for setup guidance
- **Contributing** — See [`CONTRIBUTING.md`](CONTRIBUTING.md) for contribution guidelines
- **Security** — See [`SECURITY.md`](SECURITY.md) for security policy and vulnerability reporting
- **Issues** — Report bugs or request features via [GitHub Issues](https://github.com/abonnet-qarapulse/pulse-eqms-starter/issues)
- **QARA PULSE** — For professional support, consulting, or advanced features, visit [qarapulse.com](https://qarapulse.com)

## About QARA PULSE

This Git-native eQMS framework is developed by **QARA PULSE**.

QARA PULSE designs compliance infrastructure for digital health companies — connecting regulatory requirements, product development, and technical execution into coherent, scalable systems.

Our work is grounded in a simple conviction:
**compliance should not slow teams down — it should give structure, clarity, and momentum.**

QARA PULSE brings together regulatory specialists, software engineers, and product leaders to help medical device software organizations:

- structure their Quality Management Systems from first principles,
- align ISO 13485, MDR, and software lifecycle requirements,
- and build regulatory foundations that scale with the product.

Across more than 20 healthtech and medtech projects, we have supported teams from early regulatory strategy to ISO 13485 certification and CE marking, with a strong focus on long-term system robustness rather than short-term checkbox compliance.

**Learn more:** [https://qarapulse.com](https://qarapulse.com)

## Open Core Philosophy

This repository provides the open-source core of a Git-native eQMS.

QARA PULSE builds on top of this foundation with:

- Advanced, field-tested procedure and template content
- Regulatory-grade automations and quality gates
- Structured instantiation and scaling support
- (Coming next) AI-assisted QMS governance and intelligence

Organizations are free to use this framework independently or extend it with QARA PULSE expertise, content, and tooling.

## License

This project is released under the **Apache License 2.0**.

See [`LICENSE`](LICENSE) for the full license text.

## Disclaimer

This framework provides structure and templates only.

Each organization remains responsible for:

- ensuring regulatory compliance,
- adapting procedures to its specific context,
- appointing qualified Quality and Regulatory roles,
- and obtaining required certifications and approvals.

This framework does not replace professional Quality or Regulatory expertise.

---

**Framework developed by QARA PULSE**  
*We don't build medtechs. We build the infrastructure for medtechs to grow.*
