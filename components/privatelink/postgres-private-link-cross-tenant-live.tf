data "local_file" "postgres-private-link-cross-tenant-live" {
  filename = "${path.cwd}/../../environments/privatelink/postgres-private-link-cross-tenant-live.yml"
}

module "postgres-private-link-cross-tenant-live" {
  source = "../../modules/azure-private-dns/"

  providers = {
    azurerm = azurerm.cross_tenant_live
  }

  cname_records       = yamldecode(data.local_file.postgres-private-link-cross-tenant-live.content).cname
  a_recordsets        = yamldecode(data.local_file.postgres-private-link-cross-tenant-live.content).A
  zone_name           = yamldecode(data.local_file.postgres-private-link-cross-tenant-live.content).name
  vnet_links          = yamldecode(data.local_file.postgres-private-link-cross-tenant-live.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product

  create_zone = false
}