# Contributing to Git-native eQMS Framework

Thank you for your interest in contributing to the Git-native eQMS Framework! This document provides guidelines and instructions for contributing.

---

## Code of Conduct

By participating in this project, you agree to maintain a respectful and collaborative environment. We value contributions from everyone and are committed to providing a welcoming experience.

---

## How Can I Contribute?

### Reporting Bugs

If you find a bug or issue:

1. **Check existing issues** to see if it has already been reported
2. **Create a new issue** with:
   - Clear, descriptive title
   - Steps to reproduce the issue
   - Expected vs. actual behavior
   - Environment details (if relevant)
   - Any relevant screenshots or examples

### Suggesting Enhancements

We welcome suggestions for improvements:

1. **Check existing issues** for similar suggestions
2. **Open an issue** with:
   - Clear description of the enhancement
   - Use case or problem it would solve
   - Potential implementation approach (if you have ideas)

### Contributing Code or Documentation

#### Process Overview

1. **Fork the repository**
2. **Create a feature branch** from `main`
3. **Make your changes**
4. **Test your changes** (if applicable)
5. **Submit a Pull Request**

#### Pull Request Guidelines

##### Branch Naming

Use descriptive branch names:
- `fix/description` for bug fixes
- `feature/description` for new features
- `docs/description` for documentation improvements
- `refactor/description` for refactoring

##### Pull Request Structure

Follow the existing Pull Request template (`.github/pull_request_template.md`). Include:

- **Clear description** of what changed and why
- **Type of change**: Editorial, controlled change, or substantial change
- **Impact analysis**: What documents/processes are affected
- **Links** to related issues (if applicable)

##### Documentation Standards

When contributing documentation:

- **Follow existing structure**: Maintain consistency with current documentation patterns
- **YAML headers**: Ensure all QMS documents have proper YAML metadata headers
- **Markdown formatting**: Use clear headings, lists, and code blocks where appropriate
- **Language**: Use clear, professional language suitable for regulatory documentation
- **Placeholders**: Maintain placeholder format (`{{PLACEHOLDER}}` or `TBD`) for organization-specific content

##### Code Standards

When contributing scripts or automation:

- **Documentation**: Include clear docstrings/comments
- **Error handling**: Include appropriate error handling
- **Dependencies**: Document any new dependencies
- **Testing**: Test scripts locally before submitting

#### Review Process

1. **CODEOWNERS review**: Changes are reviewed by designated code owners
2. **Automated checks**: CI/CD checks must pass (if implemented)
3. **Feedback**: Address any review comments
4. **Approval**: At least one CODEOWNER approval is required
5. **Merge**: Approved changes are merged into `main`

---

## QMS-Specific Considerations

### Document Control

This repository follows QMS document control principles:

- **All changes via Pull Request**: Direct commits to `main` are not allowed
- **Review required**: CODEOWNERS approval is mandatory
- **Traceability**: Git history provides the audit trail
- **Impact analysis**: Substantial changes require impact analysis

### Types of Contributions

**Editorial Changes** (wording, formatting, typos):
- Require review but generally low risk
- Should maintain document structure and metadata

**Controlled Changes** (non-substantial improvements):
- Updates to procedures, templates, or documentation
- Should include rationale and impact analysis
- May require updating related documents (e.g., SMQ Index)

**Substantial Changes** (regulatory or structural impact):
- Major changes to QMS structure or procedures
- Changes affecting regulatory compliance
- Require detailed impact analysis and justification

### Document Metadata

When modifying QMS documents:

- **Preserve YAML headers**: Maintain existing metadata structure
- **Update indexes**: If adding/removing documents, update `qms/00_index/SMQ-INDEX.md`
- **Version control**: Let Git handle versioning (no manual version tables)
- **Status**: Maintain appropriate status values (`Draft`, `Active`, etc.)

---

## Development Setup

### Prerequisites

- Git
- A GitHub account
- Text editor or Markdown editor
- (Optional) Python 3.x for automation scripts

### Local Development

1. **Fork the repository** on GitHub
2. **Clone your fork**:
   ```bash
   git clone git@github.com:YOUR_USERNAME/qara-pulse-eqms.git
   cd pulse-eqms-starter
   ```
3. **Add upstream remote**:
   ```bash
   git remote add upstream git@github.com:abonnet-qarapulse/qara-pulse-eqms.git
   ```
4. **Create a branch** for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```
5. **Make your changes** and commit them
6. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```
7. **Open a Pull Request** on GitHub

### Keeping Your Fork Updated

```bash
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

---

## Questions?

If you have questions about contributing:

- **Open an issue** with the `question` label
- **Check the README** for general information
- **Review existing issues** for similar questions

---

## License

By contributing to this project, you agree that your contributions will be licensed under the Apache License 2.0, the same license that covers the project.

---

Thank you for contributing to the Git-native eQMS Framework! 🚀
