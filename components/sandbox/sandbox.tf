resource "azurerm_private_dns_a_record" "plum_recipe_backend_tls" {
  name                = "plum-recipe-backend-tls"
  zone_name           = "sandbox.platform.hmcts.net"
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = ["20.108.136.254"]
}