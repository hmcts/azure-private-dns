provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  auxiliary_tenant_ids            = var.auxiliary_tenant_ids
}

terraform {
  required_version = ">= 1.8.0"

  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
}
