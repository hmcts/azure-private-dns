provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

terraform {
  required_version = ">= 1.8.0"

  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.58.0"
    }
  }
}