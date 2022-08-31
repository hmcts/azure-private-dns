data "local_file" "aat2-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/staging/service-core-compute-idam-aat2-internal.yml"
}

module "aat2-idam-internal" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.aat2-idam-internal-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.aat2-idam-internal-configuration.content).A
  zone_name           = yamldecode(data.local_file.aat2-idam-internal-configuration.content).name
  vnet_links          = yamldecode(data.local_file.aat2-idam-internal-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
