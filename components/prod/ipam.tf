data "local_file" "ipam-hmcts" {
  filename = "${path.cwd}/../../environments/prod/ipam-hmcts-net.yml"
}

module "ipam" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.ipam-hmcts.content).cname
  a_recordsets        = yamldecode(data.local_file.ipam-hmcts.content).A
  zone_name           = yamldecode(data.local_file.ipam-hmcts.content).name
  vnet_links          = yamldecode(data.local_file.ipam-hmcts.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
