data "local_file" "test-internal-hmcts-net-configuration" {
  filename = "${path.cwd}/../../environments/test/test-internal-hmcts-net.yml"
}

module "test-internal-hmcts-net" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.test-internal-hmcts-net-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.test-internal-hmcts-net-configuration.content).A
  zone_name           = yamldecode(data.local_file.test-internal-hmcts-net-configuration.content).name
  vnet_links          = yamldecode(data.local_file.test-internal-hmcts-net-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
