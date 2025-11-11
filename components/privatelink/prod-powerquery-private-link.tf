data "local_file" "prod-powerquery-private-link" {
  filename = "${path.cwd}/../../environments/privatelink/prod-powerquery-private-link.yml"
}

module "prod-powerquery-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.prod-powerquery-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.prod-powerquery-private-link.content).A
  zone_name           = yamldecode(data.local_file.prod-powerquery-private-link.content).name
  vnet_links          = yamldecode(data.local_file.prod-powerquery-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
