data "local_file" "postgres" {
  filename = "${path.cwd}/../../environments/privatelink/postgres.yml"
}

module "postgres" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.postgres.content).cname
  a_recordsets        = yamldecode(data.local_file.postgres.content).A
  zone_name           = yamldecode(data.local_file.postgres.content).name
  vnet_links          = yamldecode(data.local_file.postgres.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
