data "local_file" "crime-idam-sandbox-internal-configuration" {
  filename = "${path.cwd}/../../environments/sandbox/service-core-compute-crime-idam-sandbox-internal.yml"
}

module "crime-idam-sandbox-internal" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.crime-idam-sandbox-internal-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.crime-idam-sandbox-internal-configuration.content).A
  zone_name           = yamldecode(data.local_file.crime-idam-sandbox-internal-configuration.content).name
  vnet_links          = yamldecode(data.local_file.crime-idam-sandbox-internal-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
