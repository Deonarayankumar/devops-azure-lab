# Azure Tagging Runbook

Consistent tags and naming enable cost allocation, access control, and automation. This lab enforces tags via Terraform `locals.common_tags`.

## Required Tags

| Tag | Example | Purpose |
|-----|---------|---------|
| `environment` | `dev` | Lifecycle stage |
| `project` | `devops-azure-lab` | Cost and ownership grouping |
| `managed_by` | `terraform` | Provisioning source |

Optional tags via `additional_tags` variable (e.g. `owner`, `cost_center`).

## Naming Convention

```
{prefix}-{resource-type}
```

Examples with `prefix = devopslab`:

- `devopslab-rg` — Resource Group
- `devopslab-vnet` — Virtual Network
- `devopslab-app-subnet` — Subnet
- `devopslab-nsg` — NSG
- `devopslab-asp` — App Service Plan
- `devopslab-app` — Web App
- `devopslab-kv` — Key Vault

## Prefix Rules

- 3–10 lowercase alphanumeric characters
- Must start with a letter
- Validated in `variables.tf`

## Applying Tags in Terraform

```hcl
locals {
  common_tags = merge(
    {
      environment = var.environment
      project     = var.project
      managed_by  = "terraform"
    },
    var.additional_tags
  )
}
```

Pass `tags = local.common_tags` to every resource and module.

## Auditing Tags

```bash
az group list --query "[].{name:name, tags:tags}" -o table
bash scripts/azure-inventory.sh
```

## Remediation

1. Update `additional_tags` in `terraform.tfvars`
2. Run `terraform plan` — tag-only changes are safe
3. Apply during a maintenance window if many resources change

## Do Not Tag

- Secrets, keys, or connection strings (use Key Vault references)
- `terraform.tfstate` (never commit)
