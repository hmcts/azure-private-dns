//resource "azurerm_private_dns_cname_record" "this" {
//  count = length(var.cname_records)
//
//  name                = var.cname_records[count.index].name
//  zone_name           = var.cname_records[count.index].zone
//  resource_group_name = var.resource_group_name
//  ttl                 = var.cname_records[count.index].ttl
//  record              = var.cname_records[count.index].record
//}
resource "azurerm_private_dns_cname_record" "this" {
  for_each = toset(var.cname_records)

  name                = each.value.name
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record
}
