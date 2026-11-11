resource "azurerm_role_assignment" "ai_gateway_cross_tenant_reader" {
  scope                = "/subscriptions/1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
  role_definition_name = "Reader"
  principal_id         = "1685afa4-9f62-4760-a789-14e63108f6c5" # crime-ai-gateway-cross-tenant-peering-nonprod
}
