data "local_file" "sql-managed-instance-private-link" {
  filename = "${path.cwd}/../../environments/privatelink/sql-managed-instance-private-link.yml"
}

module "sql-managed-instance-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.postgres-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.postgres-private-link.content).A
  zone_name           = yamldecode(data.local_file.postgres-private-link.content).name
  vnet_links          = yamldecode(data.local_file.postgres-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}