module "staging-platform-cross-tenant-nonlive" {
  source = "../../modules/azure-private-dns/"

  providers = {
    azurerm = azurerm.cross_tenant_nonlive
  }

  cname_records       = yamldecode(data.local_file.staging-platform-cross-tenant-nonlive.content).cname
  a_recordsets        = yamldecode(data.local_file.staging-platform-cross-tenant-nonlive.content).A
  zone_name           = yamldecode(data.local_file.staging-platform-cross-tenant-nonlive.content).name
  vnet_links          = yamldecode(data.local_file.staging-platform-cross-tenant-nonlive.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product

  create_zone = false

  depends_on = [module.staging-platform]
}
