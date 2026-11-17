data "local_file" "azure-managed-redis" {
  filename = "${path.cwd}/../../environments/privatelink/azure-managed-redis.yml"
}

data "azuread_service_principal" "azure_managed_redis_contributors" {
  for_each     = toset(try(yamldecode(data.local_file.azure-managed-redis.content).contributors, []))
  display_name = each.value
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

  zone_contributors = values(data.azuread_service_principal.azure_managed_redis_contributors)[*].object_id
}