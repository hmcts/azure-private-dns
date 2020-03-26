resource "azurerm_private_dns_a_record" "this" {
  for_each = toset(var.a_recordsets)

  name                = each.value.name
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record
}
