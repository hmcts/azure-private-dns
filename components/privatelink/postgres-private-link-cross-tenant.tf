data "local_file" "postgres-private-link-cross-tenant" {
  filename = "${path.cwd}/../../environments/privatelink/postgres-private-link-cross-tenant.yml"
}

module "postgres-private-link-cross-tenant" {
  source = "../../modules/azure-private-dns/"

  providers = {
    azurerm = azurerm.cross_tenant
  }

  cname_records       = yamldecode(data.local_file.postgres-private-link-cross-tenant.content).cname
  a_recordsets        = yamldecode(data.local_file.postgres-private-link-cross-tenant.content).A
  zone_name           = yamldecode(data.local_file.postgres-private-link-cross-tenant.content).name
  vnet_links          = yamldecode(data.local_file.postgres-private-link-cross-tenant.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product

  create_zone = false
}
