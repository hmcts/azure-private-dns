resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

//resource "azurerm_private_dns_zone" "dns_zones" {
//  for_each = toset(var.zone_names)
//
//  name                = each.value
//  resource_group_name = var.resource_group_name
//}
resource "azurerm_private_dns_zone" "zone" {
  name                = var.zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link" {
  for_each = toset(var.vnet_links)

  name                  = each.value.link_name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = var.zone_name
  virtual_network_id    = each.value.vnet_id
}
