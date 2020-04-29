resource "azurerm_private_dns_zone" "zone" {
  name                = var.zone_name
  resource_group_name = var.resource_group_name

  tags = local.common_tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link" {
  for_each = { for record in var.vnet_links : record.link_name => record }

  name                  = each.value.link_name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.zone.name
  virtual_network_id    = each.value.vnet_id
  registration_enabled = contains(keys(each.value), "registration_enabled") ? true : false
}
