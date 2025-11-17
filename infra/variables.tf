variable "prefix" {
  description = "Short prefix for resource names."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "eastus"
}
