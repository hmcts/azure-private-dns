//resource "azurerm_private_dns_a_record" "this" {
//  count = length(var.a_recordsets)
//
//  name                = var.a_recordsets[count.index].name
//  zone_name           = var.a_recordsets[count.index].zone
//  resource_group_name = var.resource_group_name
//  ttl                 = var.a_recordsets[count.index].ttl
//  records             = var.a_recordsets[count.index].record
//}
resource "azurerm_private_dns_a_record" "this" {
  for_each = toset(var.a_recordsets)

  name                = each.value.name
  zone_name           = each.value.zone
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record
}
