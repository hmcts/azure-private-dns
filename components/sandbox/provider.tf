provider "azurerm" {
  version = "=2.3.0"
  features {}
}

terraform {
  backend "azurerm" {}
}
