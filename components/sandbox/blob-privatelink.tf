data "local_file" "blob-privatelink-configuration" {
  filename = "${path.cwd}/../../environments/sandbox/blob-privatelink.yml"
}

module "sandbox-platform" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.blob-privatelink-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.blob-privatelink-configuration.content).A
  zone_name           = yamldecode(data.local_file.blob-privatelink-configuration.content).name
  vnet_links          = yamldecode(data.local_file.blob-privatelink-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
