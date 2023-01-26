data "local_file" "demo-internal-hmcts-configuration" {
  filename = "${path.cwd}/../../environments/demo/demo-internal-hmcts-net.yml"
}

module "demo-internal-hmcts-net" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.demo-internal-hmcts-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.demo-internal-hmcts-configuration.content).A
  zone_name           = yamldecode(data.local_file.demo-internal-hmcts-configuration.content).name
  vnet_links          = yamldecode(data.local_file.demo-internal-hmcts-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
