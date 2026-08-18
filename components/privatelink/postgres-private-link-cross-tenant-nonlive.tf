data "local_file" "postgres-private-link-cross-tenant-nonlive" {
  filename = "${path.cwd}/../../environments/privatelink/postgres-private-link-cross-tenant-nonlive.yml"
}

module "postgres-private-link-cross-tenant-nonlive" {
  source = "../../modules/azure-private-dns/"

  providers = {
    azurerm = azurerm.cross_tenant_nonlive
  }

  cname_records       = yamldecode(data.local_file.postgres-private-link-cross-tenant-nonlive.content).cname
  a_recordsets        = yamldecode(data.local_file.postgres-private-link-cross-tenant-nonlive.content).A
  zone_name           = yamldecode(data.local_file.postgres-private-link-cross-tenant-nonlive.content).name
  vnet_links          = yamldecode(data.local_file.postgres-private-link-cross-tenant-nonlive.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product

  create_zone = false
}
