---
doc_id: VAL-EQMS-GIT-04
title: "Supplier Assessment - GitHub"
doc_type: "Validation Record"
process: "QMS"
owner: TBD
status: Draft
version: "0.1"
effective_date: TBD
---

# Supplier Assessment - GitHub

## Purpose

This document provides an assessment of GitHub, Inc. as a SaaS supplier for the Git-native eQMS platform. The assessment is performed in accordance with the organization's **Purchasing and Supplier Evaluation Procedure** and ISO 13485:2016 requirements for control of externally provided products and services.

---

## Supplier Information

| Attribute | Details |
|-----------|---------|
| **Supplier Name** | GitHub, Inc. (a subsidiary of Microsoft Corporation) |
| **Service Provided** | Git repository hosting platform (SaaS) |
| **Service URL** | https://github.com |
| **Service Type** | Software as a Service (SaaS) — cloud-based repository hosting, collaboration, CI/CD |
| **Service Plan** | [Organization to specify: Free, Team, Enterprise Cloud, Enterprise Server] |
| **Contract/Terms** | GitHub Terms of Service + applicable service agreement |
| **Supplier Type** | Critical SaaS supplier (infrastructure for QMS document control) |

---

## Intended Use within QMS

GitHub is used as the hosting platform for the organization's Git-native eQMS, specifically for:

- Repository hosting and storage
- Access control and authentication
- Collaboration features (Pull Requests, Reviews, Issues)
- Workflow automation (GitHub Actions)
- Audit trail preservation (Git history)

**Criticality:** High — GitHub is a critical component of the QMS infrastructure. Unavailability or malfunction impacts document control operations.

---

## Supplier Assessment Criteria

### 1. Quality Management and Certifications

| Criterion | Status | Evidence/Notes |
|-----------|--------|----------------|
| **ISO 27001 Certification** | [To be verified by organization] | GitHub has historically held ISO 27001 certification. Organization must verify current certification status. |
| **SOC 2 Type II Compliance** | [To be verified by organization] | GitHub publishes SOC 2 Type II reports. Organization must obtain and review latest report. |
| **GDPR Compliance** | [To be verified by organization] | GitHub provides GDPR-compliant data processing terms. Organization must review DPA. |
| **Business Continuity** | [To be verified by organization] | GitHub maintains business continuity and disaster recovery capabilities. Organization to assess service level agreements. |

**Action Required by Organization:**
- Obtain GitHub's current ISO 27001 certificate
- Request and review GitHub's latest SOC 2 Type II report
- Review GitHub's Data Processing Agreement (DPA)
- Review GitHub's SLA and uptime commitments

### 2. Service Reliability and Performance

| Criterion | Assessment |
|-----------|------------|
| **Uptime/Availability** | GitHub provides SLA commitments (typically 99.9%+ for paid plans). Organization to verify applicable SLA. |
| **Incident History** | GitHub publishes incident history on status.github.com. Organization to review historical availability. |
| **Support Availability** | Support level depends on service plan (community support for free, priority support for paid plans). |
| **Performance** | Generally meets industry standards for repository hosting. Organization to monitor actual performance. |

### 3. Security and Data Protection

| Criterion | Assessment |
|-----------|------------|
| **Data Encryption** | Data encrypted in transit (TLS) and at rest. |
| **Access Control** | Robust access control mechanisms (teams, permissions, 2FA/MFA support). |
| **Audit Logging** | Comprehensive audit logs available (especially for Enterprise plans). |
| **Vulnerability Management** | GitHub Security Lab actively identifies and patches vulnerabilities. |
| **Data Location** | Data stored in GitHub's data centers (location depends on service plan). Organization to verify compliance with data residency requirements. |

### 4. Vendor Stability and Longevity

| Criterion | Assessment |
|-----------|------------|
| **Financial Stability** | GitHub is owned by Microsoft Corporation (publicly traded, financially stable). Low risk of business discontinuation. |
| **Market Position** | GitHub is the leading Git hosting platform with widespread adoption. |
| **Long-term Viability** | Strong market position and corporate backing indicate long-term viability. |

### 5. Regulatory Compliance Support

| Criterion | Assessment |
|-----------|------------|
| **Compliance Documentation** | GitHub provides compliance documentation (SOC reports, certifications). |
| **Audit Support** | GitHub supports customer audits through documentation and audit logs. |
| **Data Processing Agreement** | GitHub provides DPA for GDPR compliance. |

---

## Risk Assessment

| Risk | Likelihood | Severity | Mitigation |
|------|-----------|----------|-----------|
| **GitHub service outage** | Low | Medium | Backup strategy (local mirror), Git distributed nature enables continued local work |
| **GitHub discontinues service** | Very Low | High | Backup enables migration to alternative hosting (GitLab, Bitbucket, self-hosted) |
| **Data breach at GitHub** | Low | High | GitHub security controls, encryption, monitoring; backup in separate location |
| **GitHub terms change unfavorably** | Low | Medium | Monitor terms of service, maintain backup, migration plan documented |
| **Regulatory non-compliance** | Low | Medium | Supplier assessment, review certifications, monitor GitHub compliance posture |

**Overall Risk Level:** Medium — Risk is acceptable with implemented mitigation measures (backup, monitoring, periodic reassessment).

---

## Mitigation and Control Measures

The organization implements the following controls to mitigate supplier risks:

1. **Backup Strategy**
   - Regular backup using `git clone --mirror` (documented in `05_Backup-and-Continuity-Strategy.md`)
   - Backup stored in separate location (not on GitHub)
   - Restore procedure tested periodically

2. **Access Control**
   - GitHub access restricted to authorized personnel
   - 2FA/MFA enforced for all users
   - Regular access reviews conducted

3. **Monitoring**
   - Monitor GitHub status page for incidents
   - Review GitHub security advisories
   - Track GitHub platform updates and changes

4. **Exit Strategy**
   - Git repository can be migrated to alternative hosting if needed
   - Backup enables full recovery and migration
   - Migration process documented (if required)

5. **Periodic Reassessment**
   - Review supplier assessment annually or when significant changes occur
   - Verify current certifications (ISO 27001, SOC 2)
   - Review incident history and performance

---

## Supplier Approval Status

**Status:** [To be determined by organization]

**Approval Criteria Met:**
- [ ] ISO 27001 certification verified
- [ ] SOC 2 Type II report reviewed
- [ ] DPA reviewed and accepted
- [ ] SLA reviewed and acceptable
- [ ] Risk assessment completed
- [ ] Mitigation measures implemented
- [ ] Backup strategy in place and tested

**Approval Decision:** [Approved / Conditionally Approved / Not Approved]

**Approved By:** [Name, Role, Date]

**Next Review Date:** [Annual review recommended]

---

## Documentation and Records

The following documentation should be collected and maintained:

- GitHub Terms of Service (current version)
- GitHub Data Processing Agreement (signed, if applicable)
- GitHub ISO 27001 certificate (if available)
- GitHub SOC 2 Type II report (latest)
- GitHub SLA documentation
- Internal risk assessment and approval record

**Storage Location:** `qms/06_records/supplier-evaluations/GitHub/`

---

## Periodic Review

This supplier assessment shall be reviewed:

- **Annually** — Standard periodic review
- **When GitHub changes terms of service** — Review impact on QMS operations
- **When GitHub has major security incident** — Reassess risk and controls
- **When organization changes GitHub plan** — Verify new plan meets requirements
- **During internal audits** — Verify supplier controls remain effective

---

## Related QMS Documents

- Purchasing and Supplier Evaluation Procedure
- Backup and Continuity Strategy (05_Backup-and-Continuity-Strategy.md)
- Risk Assessment (02_Risk-Assessment.md)
- IT Infrastructure Management Procedure

---

## Notes for Organization

**Action Items:**
1. Verify GitHub's current ISO 27001 certification status
2. Request and review GitHub's latest SOC 2 Type II report
3. Review GitHub's Data Processing Agreement and sign if required
4. Document GitHub service plan being used
5. Complete approval decision and document approval record
6. Establish periodic review schedule

**Contact Information:**
- GitHub Support: https://support.github.com
- GitHub Security: https://github.com/security
- GitHub Compliance: https://github.com/customer-terms

---

This document is provided as part of the Git-native eQMS framework developed by **QARA PULSE**.

Framework developed by QARA PULSE — *We don't build medtechs. We build infrastructure for medtechs to grow.*
