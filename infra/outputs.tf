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
