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


module "network" {
  source = "./modules/network"

  prefix              = var.prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  vnet_address_space  = var.vnet_address_space
  app_subnet_prefix   = var.app_subnet_prefix
  tags                = local.common_tags
}
