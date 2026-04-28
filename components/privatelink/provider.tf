provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

provider "azurerm" {
  alias = "cross_tenant_nonlive"

  features {}
  resource_provider_registrations = "none"

  subscription_id      = var.cross_tenant_nonlive_subscription_id
  tenant_id            = var.cross_tenant_nonlive_tenant_id
  client_id            = var.cross_tenant_nonlive_client_secret != "" ? var.cross_tenant_nonlive_client_id : null
  client_secret        = var.cross_tenant_nonlive_client_secret != "" ? var.cross_tenant_nonlive_client_secret : null
  auxiliary_tenant_ids = var.cross_tenant_nonlive_auxiliary_tenant_ids
}

terraform {
  required_version = ">= 1.8.0"

  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
}
