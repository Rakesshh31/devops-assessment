# Infrastructure as Code (Terraform)

This directory contains all Terraform configurations for the DevOps assessment project.

## Directory Structure

- **modules/**: Reusable Terraform modules for common infrastructure components
- **envs/**: Environment-specific configurations (dev, staging, production)

## Getting Started

### Prerequisites
- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- Terraform Cloud account (optional, for remote state)

### Initialize Terraform

```bash
cd infra
terraform init
```

### Plan Changes

```bash
terraform plan -var-file=envs/dev.tfvars
```

### Apply Configuration

```bash
terraform apply -var-file=envs/dev.tfvars
```

### Destroy Infrastructure

```bash
terraform destroy -var-file=envs/dev.tfvars
```

## Module Structure

Each module in the `modules/` directory should follow this structure:

```
module_name/
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

## Environment Management

Configuration files for different environments:

- `envs/dev.tfvars` - Development environment
- `envs/staging.tfvars` - Staging environment
- `envs/prod.tfvars` - Production environment

## Best Practices

- Always run `terraform plan` before applying
- Use version constraints for all providers and modules
- Store sensitive data in Terraform Cloud or AWS Secrets Manager
- Use workspaces for environment isolation
- Enable remote state management

## Troubleshooting

For common issues and solutions, refer to the Terraform documentation:
https://www.terraform.io/docs
