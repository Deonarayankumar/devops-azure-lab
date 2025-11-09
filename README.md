# DevOps Azure Lab

Terraform lab for Azure infrastructure: Resource Group, VNet, NSG, App Service, and Key Vault using the `azurerm` provider.

## Architecture

```
Resource Group
├── Virtual Network (module: infra/modules/network)
│   ├── Subnet: app
│   └── NSG rules (HTTP/HTTPS inbound)
├── App Service Plan + Linux Web App
└── Key Vault (RBAC, soft delete)
```

## Prerequisites

- Azure CLI (`az login`)
- Terraform 1.5+
- Service principal or user with Contributor on the target subscription

## Quick Start

```bash
cd infra
terraform init
terraform plan -var="prefix=devopslab" -var="location=eastus"
```

Do not commit `terraform.tfstate` or secrets. Use `terraform.tfvars` locally (not tracked).

## Modules

| Path | Purpose |
|------|---------|
| `infra/modules/network` | Reusable VNet, subnet, and NSG |

## Scripts

- `scripts/azure-inventory.sh` — List resource groups, VNets, and App Services in the subscription

## CI

GitHub Actions workflow `.github/workflows/terraform-validate.yml` runs `terraform fmt`, `validate`, and `plan` (no apply).

## Tagging

See `docs/tagging-runbook.md` for required tags and naming conventions.
