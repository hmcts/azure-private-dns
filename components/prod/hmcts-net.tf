data "local_file" "hmcts-net-configuration" {
  filename = "${path.cwd}/../../environments/prod/hmcts-net.yml"
}

module "hmcts-net" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.hmcts-net-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.hmcts-net-configuration.content).A
  zone_name           = yamldecode(data.local_file.hmcts-net-configuration.content).name
  vnet_links          = yamldecode(data.local_file.hmcts-net-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}

resource "azurerm_role_assignment" "atlassian_nonprod_reader" {
  scope                = module.hmcts-net.private_dns_zone_id
  role_definition_name = "Reader"
  principal_id         = "689d247b-3558-4c62-ac72-a834bd3208a5" # DTS Bootstrap (sub:moj dcd atlassian nle)
}
