module "demo-idam-internal" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.demo-idam-internal-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.demo-idam-internal-configuration.content).A
  zone_name           = yamldecode(data.local_file.demo-idam-internal-configuration.content).name
  vnet_links          = yamldecode(data.local_file.demo-idam-internal-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
}
