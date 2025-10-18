terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.110"
    }
  }
}

provider "azurerm" {
  features {}
}

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

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags     = local.common_tags
}
