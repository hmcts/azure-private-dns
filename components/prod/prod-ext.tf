data "local_file" "prod-ext-hmcts-configuration" {
  filename = "${path.cwd}/../../environments/prod/prod-ext-platform-hmcts-net.yml"
}

module "prod-ext-hmcts-net" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.prod-ext-hmcts-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.prod-ext-hmcts-configuration.content).A
  zone_name           = yamldecode(data.local_file.prod-ext-hmcts-configuration.content).name
  vnet_links          = yamldecode(data.local_file.prod-ext-hmcts-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
