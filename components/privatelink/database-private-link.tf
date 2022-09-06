data "local_file" "database-private-link" {
  filename = "${path.cwd}/../../environments/privatelink/database-private-link.yml"
}

module "database-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.database-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.database-private-link.content).A
  zone_name           = yamldecode(data.local_file.database-private-link.content).name
  vnet_links          = yamldecode(data.local_file.database-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
