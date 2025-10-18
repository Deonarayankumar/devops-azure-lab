output "vnet_id" {
  description = "Virtual network resource ID."
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Virtual network name."
  value       = azurerm_virtual_network.main.name
}

output "app_subnet_id" {
  description = "Application subnet resource ID."
  value       = azurerm_subnet.app.id
}
