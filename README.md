# Mini DevSecOps Pipeline

## Hvad er projektet?
Et lærings- og portfolioprojekt hvor jeg har bygget en automatisk sikkerhedspipeline ved hjælp af GitHub Actions. Formålet er at demonstrere "shift left" princippet inden for DevSecOps – altså at sikkerhed er integreret tidligt i udviklingsprocessen, fremfor at blive tænkt ind til sidst.

Pipelinen kører automatisk hver gang kode pushes til repositoryet, og branch protection sikrer at sårbar kode ikke kan merges ind i main.

## Scanningsværktøjer

| Værktøj | Formål |
|---|---|
| **TruffleHog** | Scanner koden for hardkodede secrets og API-nøgler |
| **Snyk** | Scanner dependencies for kendte sårbarheder |
| **Semgrep** | SAST – analyserer kode-logikken for sikkerhedsfejl som XSS og command injection |
| **Checkov** | Scanner Azure infrastruktur (Terraform) for fejlkonfigurationer |
| **Trivy** | Scanner Docker containeren for kendte CVE'er |

## Teknologier
- GitHub Actions
- Docker
- Terraform (IaC scanning med Checkov)
- Node.js

## Hvad jeg har lært
- Opsætning af CI/CD pipelines med GitHub Actions
- Infrastructure as Code scanning med Terraform og Checkov
- Hvordan man læser og forstår output fra sikkerhedsscannere
- Branch protection og pull request workflows