data "local_file" "demo-apps-hmcts-net-config" {
  filename = "${path.cwd}/../../environments/demo/demo-apps-hmcts-net.yml"
}

module "demo-apps-private-dns" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.demo-apps-hmcts-net-config.content).cname
  a_recordsets        = yamldecode(data.local_file.demo-apps-hmcts-net-config.content).A
  zone_name           = yamldecode(data.local_file.demo-apps-hmcts-net-config.content).name
  vnet_links          = yamldecode(data.local_file.demo-apps-hmcts-net-config.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
