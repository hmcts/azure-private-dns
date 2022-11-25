data "local_file" "ithc-justice-configuration" {
  filename = "${path.cwd}/../../environments/ithc/ithc-hmcts-justice-gov-uk.yml"
}

module "ithc-hmcts-justice-gov-uk" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.ithc-justice-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.ithc-justice-configuration.content).A
  zone_name           = yamldecode(data.local_file.ithc-justice-configuration.content).name
  vnet_links          = yamldecode(data.local_file.ithc-justice-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
