data "local_file" "justice-configuration" {
  filename = "${path.cwd}/../../environments/prod/hmcts-justice-gov-uk.yml"
}

module "hmcts-justice-gov-uk" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.justice-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.justice-configuration.content).A
  zone_name           = yamldecode(data.local_file.justice-configuration.content).name
  vnet_links          = yamldecode(data.local_file.justice-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
