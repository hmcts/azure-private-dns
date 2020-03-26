resource "azurerm_private_dns_cname_record" "this" {
  for_each = toset(var.cname_records)

  name                = each.value.name
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record
}
