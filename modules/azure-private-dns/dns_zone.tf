resource "azurerm_private_dns_zone" "zone" {
  name                = var.zone_name
  resource_group_name = var.resource_group_name

  tags  = module.ctags.common_tags
  count = var.create_zone ? 1 : 0
}

data "azurerm_private_dns_zone" "existing" {
  count               = var.create_zone ? 0 : 1
  name                = var.zone_name
  resource_group_name = var.resource_group_name
}

locals {
  zone    = var.create_zone ? azurerm_private_dns_zone.zone[0].name : var.zone_name
  zone_id = var.create_zone ? azurerm_private_dns_zone.zone[0].id : data.azurerm_private_dns_zone.existing[0].id
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link" {
  for_each = { for record in var.vnet_links : record.link_name => record }

  name                  = each.value.link_name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = local.zone
  virtual_network_id    = each.value.vnet_id
  registration_enabled  = contains(keys(each.value), "registration_enabled") ? each.value.registration_enabled : false
  tags                  = module.ctags.common_tags
}

module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}
