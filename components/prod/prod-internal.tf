data "local_file" "prod-internal-configuration" {
  filename = "${path.cwd}/../../environments/prod/service-core-compute-prod-internal.yml"
}

module "prod-internal" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.prod-internal-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.prod-internal-configuration.content).A
  zone_name           = yamldecode(data.local_file.prod-internal-configuration.content).name
  vnet_links          = yamldecode(data.local_file.prod-internal-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
