data "local_file" "elastic_cloud_uksouth" {
  filename = "${path.cwd}/../../environments/privatelink/elastic-cloud-uksouth.yml"
}

module "elastic_cloud_uksouth" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.elastic_cloud_uksouth.content).cname
  a_recordsets        = yamldecode(data.local_file.elastic_cloud_uksouth.content).A
  zone_name           = yamldecode(data.local_file.elastic_cloud_uksouth.content).name
  vnet_links          = yamldecode(data.local_file.elastic_cloud_uksouth.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
