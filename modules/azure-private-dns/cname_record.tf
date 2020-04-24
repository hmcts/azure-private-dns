resource "azurerm_private_dns_cname_record" "this" {
  for_each = { for record in var.cname_records : record.name => record }

  name                = lower(each.value.name)
  zone_name           = azurerm_private_dns_zone.zone.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  record              = lower(each.value.record)
}
