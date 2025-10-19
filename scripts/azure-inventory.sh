#!/usr/bin/env bash
# azure-inventory.sh — List key Azure resources in the current subscription.
set -euo pipefail

SUBSCRIPTION="${AZ_SUBSCRIPTION:-}"

echo "=== Azure Inventory ==="

if ! command -v az >/dev/null 2>&1; then
  echo "Azure CLI (az) is required."
  exit 1
fi

if [[ -n "$SUBSCRIPTION" ]]; then
  az account set --subscription "$SUBSCRIPTION"
fi

CURRENT=$(az account show --query "{name:name, id:id, tenantId:tenantId}" -o json 2>/dev/null || true)
if [[ -z "$CURRENT" ]]; then
  echo "Not logged in. Run: az login"
  exit 1
fi

echo "Subscription: $CURRENT"
echo

echo "--- Resource Groups ---"
az group list --query "[].{name:name, location:location, tags:tags}" -o table

echo
echo "--- Virtual Networks ---"
az network vnet list --query "[].{name:name, rg:resourceGroup, location:location, prefixes:addressSpace.addressPrefixes}" -o table

echo
echo "--- App Services (Web Apps) ---"
az webapp list --query "[].{name:name, rg:resourceGroup, state:state, defaultHostName:defaultHostName}" -o table

echo
echo "--- Key Vaults ---"
az keyvault list --query "[].{name:name, rg:resourceGroup, location:location}" -o table

echo
echo "Done."
