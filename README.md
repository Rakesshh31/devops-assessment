# DevOps Assessment

A comprehensive DevOps project setup with infrastructure as code, database migrations, deployment scripts, and CI/CD workflows.

## Project Structure

```
devops-assessment/
├── infra/                    # Infrastructure as Code (Terraform)
│   ├── modules/             # Reusable Terraform modules
│   ├── envs/                # Environment-specific configurations
│   └── README.md
│
├── database/                # Database management
│   ├── migrations/          # Database migration scripts
│   └── seed/               # Database seed data
│
├── scripts/                 # Utility scripts
│   ├── backup.sh           # Database backup script
│   └── restore.sh          # Database restore script
│
├── .github/workflows/       # CI/CD workflows
│   └── terraform.yml       # Terraform automation workflow
│
├── docker-compose.yml       # Docker Compose configuration
├── README.md               # This file
└── .gitignore              # Git ignore rules
```

## Quick Start

1. **Set up Infrastructure**
   ```bash
   cd infra
   terraform init
   terraform plan
   terraform apply
   ```

2. **Run Database Migrations**
   ```bash
   cd database/migrations
   ./run_migrations.sh
   ```

3. **Start Services**
   ```bash
   docker-compose up -d
   ```

## Backup & Restore

- **Backup**: `./scripts/backup.sh`
- **Restore**: `./scripts/restore.sh`

## CI/CD

GitHub Actions workflows are configured in `.github/workflows/`. The terraform.yml workflow handles infrastructure automation.

## Prerequisites

- Terraform >= 1.0
- Docker & Docker Compose
- AWS CLI (if using AWS)
- Git

## Contributing

Follow the standard Git workflow and ensure all infrastructure changes are reviewed before deployment.

## License

MIT
