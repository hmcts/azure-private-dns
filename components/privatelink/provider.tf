provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

provider "azurerm" {
  alias = "cross_tenant"

  features {}
  resource_provider_registrations = "none"

  subscription_id      = var.cross_tenant_subscription_id
  tenant_id            = var.cross_tenant_tenant_id
  client_id            = var.cross_tenant_client_secret != "" ? var.cross_tenant_client_id : null
  client_secret        = var.cross_tenant_client_secret != "" ? var.cross_tenant_client_secret : null
  auxiliary_tenant_ids = var.cross_tenant_auxiliary_tenant_ids
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
