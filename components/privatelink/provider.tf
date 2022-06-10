provider "azurerm" {
  version = "=3.10.0"
  features {}
  skip_provider_registration = true
}

terraform {
  backend "azurerm" {}
}
