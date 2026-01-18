# GitHub Actions Workflows

This directory contains GitHub Actions workflows for automated quality checks and validation.

## Purpose

Workflows in this directory automate QMS-related tasks such as:

- Document metadata validation
- Index generation and consistency checks
- Quality gates for Pull Requests
- Automated testing and validation

## Customization

To create workflows for your QMS automation:

1. Create automation scripts in `scripts/` directory (see `scripts/README.md` for guidance)
2. Create workflow files (`.yml`) in this directory to reference your scripts
3. Configure required environment variables or secrets
4. Test workflows locally using [act](https://github.com/nektos/act) or by creating test PRs

## Guidelines

- Keep workflows focused on QMS validation and automation
- Document workflow purpose and dependencies
- Use appropriate GitHub Actions versions
- Follow the repository's change control process for workflow modifications
