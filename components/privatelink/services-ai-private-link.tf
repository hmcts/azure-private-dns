data "local_file" "services-ai-private-link" {
  filename = "${path.cwd}/../../environments/privatelink/cognitive-services-private-link.yml"
}

module "services-ai-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.services-ai-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.services-ai-private-link.content).A
  zone_name           = yamldecode(data.local_file.services-ai-private-link.content).name
  vnet_links          = yamldecode(data.local_file.services-ai-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
}
