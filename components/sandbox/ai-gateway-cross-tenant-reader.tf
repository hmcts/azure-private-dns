resource "azurerm_role_assignment" "ai_gateway_cross_tenant_reader" {
  scope                = "/subscriptions/1497c3d7-ab6d-4bb7-8a10-b51d03189ee3"
  role_definition_name = "Reader"
  principal_id         = "618b0805-4582-4efc-9de1-eb26cbdd6bcc" # crime-ai-gateway-cross-tenant-peering-sbox
}
