data "local_file" "dom1-infra-int-configuration" {
  filename = "${path.cwd}/../../environments/dev/dom1-infra-int.yml"
}

module "dom1-infra-int" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.dom1-infra-int-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.dom1-infra-int-configuration.content).A
  zone_name           = yamldecode(data.local_file.dom1-infra-int-configuration.content).name
  vnet_links          = yamldecode(data.local_file.dom1-infra-int-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
