# Instantiation Checklist

This checklist guides the instantiation of this Git-based eQMS starter template for a new organization.

---

## Overview

This template provides a structured foundation for a Quality Management System (QMS). Before the QMS becomes operational, you need to customize the content and metadata to reflect your organization's specific needs and structure.

---

## 1. GitHub Configuration

Replace GitHub-specific placeholders:

- **{{GITHUB_TEAM_OR_USERNAME}}** → Your GitHub team name or username for CODEOWNERS
  - Location: `.github/CODEOWNERS`

### Steps:
1. Update `.github/CODEOWNERS` file, replacing `@{{GITHUB_TEAM_OR_USERNAME}}` with your actual GitHub team or username
2. Configure branch protection rules in GitHub repository settings (recommended: require pull request reviews, require CODEOWNERS approval)
3. Verify CODEOWNERS file is properly recognized by GitHub

---

## 2. Repository Metadata and Documentation

Review and update:

- **README.md**: Review and customize as needed for your organization
- **Repository name**: Consider renaming the repository to match your organization
- **Assets**: Review `assets/` directory — replace or customize visual assets as needed (e.g., banner image)

---

## 3. QMS Document Metadata

Update document metadata in YAML headers throughout the QMS:

- **owner**: Replace `TBD` with appropriate role/function names
- **doc_id**: Replace `TBD` with unique document identifiers following your numbering scheme
- **effective_date**: Set when documents are approved and become effective
- **status**: Update from `Draft` to `Active` when documents are approved

### Key Documents to Update:
- Governance documents (`qms/01_governance/`)
- Process descriptions (`qms/02_processes/`)
- Procedures (`qms/03_procedures/`)
- Index documents (`qms/00_index/`)

### Steps:
1. Define your document numbering convention
2. Assign document IDs to all QMS documents
3. Update document owners according to your organizational structure
4. Review `qms/00_index/SMQ-INDEX.md` to ensure it reflects your document structure

---

## 4. Governance Documents Content

Customize governance documents with your organization's content:

- **Quality Manual** (`qms/01_governance/Quality-Manual.md`): Replace `[Content to be defined by the organization]` with your QMS overview, scope, and structure description
- **Quality Policy** (`qms/01_governance/Quality-Policy.md`): Define your organization's quality policy, commitments, and principles
- **Quality Objectives** (`qms/01_governance/Quality-Objectives.md`): Establish measurable quality objectives aligned with your Quality Policy

### Steps:
1. Review each governance document structure
2. Replace placeholder content with organization-specific information
3. Ensure alignment with ISO 13485 requirements
4. Obtain management approval before setting status to `Active`

---

## 5. Process Descriptions

Review and customize process descriptions:

- **Process Descriptions** (`qms/02_processes/*/Process-Description.md`): Replace placeholders `{{...}}` with organization-specific content
  - Define process scope and objectives
  - Identify inputs, outputs, and interfaces
  - Assign responsibilities
  - Link to related procedures

### Steps:
1. Review all 7 process descriptions
2. Replace placeholders with your organization's process details
3. Verify process interfaces and relationships
4. Ensure process descriptions align with your operational model

---

## 6. Procedures

Review and customize procedures:

- **Procedures** (`qms/03_procedures/`): All 30 procedures contain placeholders that need to be customized
  - Replace `[To be defined by the organization]` sections with specific content
  - Customize "1.3 Responsibilities" sections
  - Define terminology specific to your organization
  - Fill in records, retention, and access control requirements

### Steps:
1. Prioritize procedures based on your immediate operational needs
2. Customize procedures starting with critical ones (Document Control, Change Control, etc.)
3. Ensure procedures align with your processes and workflows
4. Review regulatory references (section 1.4) for relevance to your products

---

## 7. Work Instructions and Templates

Create organization-specific content:

- **Work Instructions** (`qms/04_work-instructions/`): Create detailed work instructions as needed (directory currently contains only README)
- **Templates** (`qms/05_templates/`): Create document templates based on your procedure requirements (directory currently contains only README)

### Steps:
1. Identify operational tasks requiring detailed work instructions
2. Create work instruction documents following your procedures
3. Develop templates for records and documents referenced in procedures
4. Ensure templates align with procedure requirements

---

## 8. Index Documents

Review and update index documents:

- **SMQ-INDEX.md**: Verify all QMS documents are properly indexed (should auto-update if using automation scripts)
- **LIST-OF-APPLICABLE-DOCUMENTS.md**: Review applicable regulations, standards, and guidance documents for your products and markets
- **SOFTWARE-INVENTORY.md**: Populate with your software assets when available
- **PROCESS-MAP.md**: Update with your process mapping if applicable

### Steps:
1. Review List of Applicable Documents for relevance to your products
2. Update Software Inventory as you identify software components
3. Verify SMQ Index completeness

---

## 9. Validation Steps

Before considering the QMS operational:

1. **Search for placeholder content:**
   ```bash
   grep -r "\[Content to be defined by the organization\]" qms/
   grep -r "\[To be defined by the organization\]" qms/
   grep -r "{{" qms/
   grep -r "{{" .github/
   ```

2. **Verify document metadata:**
   - Ensure no documents have `owner: TBD`, `doc_id: TBD`, or `effective_date: TBD` for approved documents
   - Review document status (should be `Active` for operational documents)

3. **Check document references:**
   - Verify all internal document links are valid
   - Ensure referenced procedures and documents exist
   - Review section 1.5 (Reference Documents) in procedures for accuracy

4. **Test workflows:**
   - Create a test branch
   - Make a test change to a QMS document
   - Create a Pull Request to verify CODEOWNERS and review workflow
   - Ensure all required approvals are in place

---

## 10. Automation (Optional)

This template supports automation but does not include pre-built scripts:

- **Scripts directory** (`scripts/`): Create automation scripts as needed (see `scripts/README.md` for guidance)
- **Makefile**: Template provided as example for structuring automation commands
- **GitHub Actions**: Example workflow template in `.github/workflows/`

### Steps:
1. Review automation possibilities in `scripts/README.md`
2. Create scripts for your specific needs (e.g., index generation, metadata validation)
3. Configure GitHub Actions workflows if needed
4. Customize Makefile if you implement automation scripts

---

## 11. Initial Commit Strategy

After instantiation:

1. Create an initial commit with all customizations
2. Use descriptive commit message summarizing your changes
3. Create a Pull Request for review (if multiple stakeholders)
4. Follow your Change Control workflow for initial approval
5. Merge to `main` to make the QMS effective

---

## 12. Additional Considerations

- **Regulatory Alignment**: Review all regulatory references (ISO 13485, EU MDR, GDPR, etc.) in `qms/00_index/LIST-OF-APPLICABLE-DOCUMENTS.md` to ensure they match your applicable regulations and markets
- **Scope**: Review process mappings and ensure they match your organization's scope and operations
- **Roles and Responsibilities**: Map document owners and responsibilities to your organizational structure
- **Document Control**: Establish your document control workflow using Git and Pull Requests
- **Training**: Ensure team members understand the Git-based document control process

---

## Summary

This template provides a complete Git-based eQMS infrastructure. After customizing content and metadata, you will have a Quality Management System that is:

- Regulatory-compliant (ISO 13485, EU MDR aligned structure)
- Traceable by design (Git-based version control)
- Auditable (Pull Request workflow with CODEOWNERS)
- Scalable (structured for growth and automation)

The QMS is ready for operations once:
- All governance documents contain organization-specific content
- Procedures are customized and approved
- Document metadata is complete
- GitHub configuration is in place
- Quality gates and workflows are tested
