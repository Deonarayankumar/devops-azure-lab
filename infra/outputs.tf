output "resource_group_name" {
  description = "Name of the deployed resource group."
  value       = azurerm_resource_group.main.name
}

output "resource_group_id" {
  description = "ID of the deployed resource group."
  value       = azurerm_resource_group.main.id
}
