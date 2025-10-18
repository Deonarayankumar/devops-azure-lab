variable "prefix" {
  description = "Short prefix for resource names (lowercase alphanumeric, max 10 chars recommended)."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9]{2,9}$", var.prefix))
    error_message = "prefix must be 3-10 lowercase alphanumeric characters starting with a letter."
  }
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Environment name used in tags (e.g. dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name for tagging."
  type        = string
  default     = "devops-azure-lab"
}

variable "additional_tags" {
  description = "Extra tags merged into all resources."
  type        = map(string)
  default     = {}
}

variable "vnet_address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "app_subnet_prefix" {
  description = "CIDR for the application subnet."
  type        = string
  default     = "10.10.1.0/24"
}

variable "app_service_sku" {
  description = "App Service Plan SKU."
  type        = string
  default     = "B1"
}

variable "app_service_always_on" {
  description = "Keep App Service always on (requires non-free SKU)."
  type        = bool
  default     = true
}
