provider "azurerm" {
  version = "=3.10.0"
  features {}
}

terraform {
  backend "azurerm" {}
}
