resource "azurerm_private_dns_a_record" "this" {
  for_each = { for record in var.a_recordsets : record.name => record }

  name                = lower(each.value.name)
  zone_name           = azurerm_private_dns_zone.zone.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.record
}
