# Security Policy

## Supported Versions

Security updates are provided for the latest version of the framework. We recommend keeping your QMS repository up to date with the latest releases.

| Version | Supported          |
| ------- | ------------------ |
| Latest  | :white_check_mark: |
| < Latest | :x:                |

## Reporting a Vulnerability

If you discover a security vulnerability in this framework, we appreciate your help in disclosing it to us in a responsible manner.

### How to Report

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, please report them by creating a **private security advisory** on GitHub:

1. Go to the [Security tab](https://github.com/abonnet-qarapulse/pulse-eqms-starter/security) in this repository
2. Click "Report a vulnerability"
3. Fill out the security advisory form with details about the vulnerability

This ensures your report remains private until we can address the issue.

### What to Include

When reporting a vulnerability, please include:

- **Description**: A clear description of the vulnerability
- **Impact**: The potential impact and severity
- **Steps to Reproduce**: Detailed steps to reproduce the issue (if applicable)
- **Suggested Fix**: Any suggestions for how the vulnerability might be addressed (optional)
- **Affected Versions**: Which versions are affected

### Response Timeline

We will make a good faith effort to:

- **Acknowledge** receipt of your report within 48 hours
- **Provide** an initial assessment within 7 business days
- **Keep** you informed of our progress
- **Coordinate** public disclosure (if applicable) after the vulnerability is addressed

### Disclosure Policy

- We request that you do not publicly disclose the vulnerability until we have had a chance to address it
- We will work with you to coordinate public disclosure if we determine the vulnerability requires public notification
- We will credit you in any public disclosure (unless you prefer to remain anonymous)

## Security Considerations for QMS Usage

This framework is designed for managing Quality Management System documentation. When implementing this framework:

1. **Review Access Controls**: Ensure proper GitHub repository access controls and CODEOWNERS configuration
2. **Branch Protection**: Enable branch protection rules to enforce review requirements
3. **Audit Trails**: Review Git history regularly to ensure compliance with audit requirements
4. **Document Security**: Consider document classification and confidentiality requirements based on your regulatory context
5. **Infrastructure Security**: Secure your Git hosting infrastructure and access credentials

## Security Best Practices

When using this framework:

- Keep your repository access controls up to date
- Use strong authentication (SSH keys, 2FA)
- Review CODEOWNERS assignments regularly
- Monitor repository access logs
- Follow your organization's information security policies
- Ensure compliance with relevant regulations (e.g., ISO 27001, GDPR) as applicable

---

**Note**: This security policy applies to the framework itself. Individual organizations using this framework are responsible for their own security practices, compliance, and risk management in their implementation.
