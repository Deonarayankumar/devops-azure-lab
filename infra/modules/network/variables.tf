variable "prefix" {
  description = "Resource name prefix."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Target resource group name."
  type        = string
}

variable "vnet_address_space" {
  description = "VNet address space list."
  type        = list(string)
}

variable "app_subnet_prefix" {
  description = "Application subnet CIDR."
  type        = string
}

variable "tags" {
  description = "Tags applied to network resources."
  type        = map(string)
  default     = {}
}
