data "local_file" "mysql-private-link" {
  filename = "${path.cwd}/../../environments/privatelink/mysql-private-link.yml"
}

module "mysql-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.mysql-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.mysql-private-link.content).A
  zone_name           = yamldecode(data.local_file.mysql-private-link.content).name
  vnet_links          = yamldecode(data.local_file.mysql-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
