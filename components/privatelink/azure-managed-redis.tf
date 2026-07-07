data "local_file" "azure-managed-redis" {
  filename = "${path.cwd}/../../environments/privatelink/azure-managed-redis.yml"
}

module "azure-managed-redis" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.azure-managed-redis.content).cname
  a_recordsets        = yamldecode(data.local_file.azure-managed-redis.content).A
  zone_name           = yamldecode(data.local_file.azure-managed-redis.content).name
  vnet_links          = yamldecode(data.local_file.azure-managed-redis.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}