output "resource_group_name" {
  description = "Name of the deployed resource group."
  value       = azurerm_resource_group.main.name
}

output "resource_group_id" {
  description = "ID of the deployed resource group."
  value       = azurerm_resource_group.main.id
}

output "vnet_id" {
  description = "ID of the virtual network."
  value       = module.network.vnet_id
}

output "vnet_name" {
  description = "Name of the virtual network."
  value       = module.network.vnet_name
}

output "app_subnet_id" {
  description = "ID of the application subnet."
  value       = module.network.app_subnet_id
}

output "nsg_id" {
  description = "ID of the network security group."
  value       = module.network.nsg_id
}

output "app_service_name" {
  description = "Name of the Linux Web App."
  value       = azurerm_linux_web_app.main.name
}

output "app_service_default_hostname" {
  description = "Default hostname for the web app."
  value       = azurerm_linux_web_app.main.default_hostname
}

output "key_vault_id" {
  description = "ID of the Key Vault."
  value       = azurerm_key_vault.main.id
}

output "key_vault_uri" {
  description = "URI of the Key Vault."
  value       = azurerm_key_vault.main.vault_uri
}
