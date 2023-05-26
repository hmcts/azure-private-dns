data "local_file" "azuremediaservices-private-link" {
  filename = "${path.cwd}/../../environments/privatelink/azuremediaservices-private-link.yml"
}

module "azuremediaservices-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.azuremediaservices-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.azuremediaservices-private-link.content).A
  zone_name           = yamldecode(data.local_file.azuremediaservices-private-link.content).name
  vnet_links          = yamldecode(data.local_file.azuremediaservices-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
}
