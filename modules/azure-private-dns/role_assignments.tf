resource "azurerm_role_assignment" "this" {
  for_each = toset(var.zone_contributors)

  scope                = local.zone_id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = each.value
}
