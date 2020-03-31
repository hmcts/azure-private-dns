module "sandbox-platform" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.sandbox-platform-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.sandbox-platform-configuration.content).A
  zone_name           = yamldecode(data.local_file.sandbox-platform-configuration.content).name
  vnet_links          = yamldecode(data.local_file.sandbox-platform-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  common_tags         = local.common_tags
}
