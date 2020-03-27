resource "azurerm_private_dns_a_record" "this" {
  for_each = { for record in var.a_recordsets : record.name => record }

  name                = each.value.name
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.record
}
