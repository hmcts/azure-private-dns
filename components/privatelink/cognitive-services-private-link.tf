data "local_file" "cognitiveservices-private-link" {
  filename = "${path.cwd}/../../environments/privatelink/cognitive-services-private-link.yml"
}

module "cognitiveservices-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.cognitiveservices-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.cognitiveservices-private-link.content).A
  zone_name           = yamldecode(data.local_file.cognitiveservices-private-link.content).name
  vnet_links          = yamldecode(data.local_file.cognitiveservices-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
}
