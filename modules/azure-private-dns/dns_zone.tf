resource "azurerm_private_dns_zone" "zone" {
  name                = var.zone_name
  resource_group_name = var.resource_group_name

  tags  = module.ctags.common_tags
  count = var.create_zone == true ? 1 : 0
}

locals {
  zone = var.create_zone == true ? azurerm_private_dns_zone.zone[0].name : var.zone_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link" {
  for_each = { for record in var.vnet_links : record.link_name => record }

  name                  = each.value.link_name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = local.zone
  virtual_network_id    = each.value.vnet_id
  registration_enabled  = contains(keys(each.value), "registration_enabled") ? each.value.registration_enabled : false
}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}
