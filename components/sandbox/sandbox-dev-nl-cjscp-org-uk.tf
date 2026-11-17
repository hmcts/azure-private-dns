data "local_file" "sandbox-dev-nl-cjscp-org-uk-configuration" {
  filename = "${path.cwd}/../../environments/sandbox/sandbox-dev-nl-cjscp-org-uk.yml"
}

module "sandbox-dev-nl-cjscp-org-uk" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.sandbox-dev-nl-cjscp-org-uk-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.sandbox-dev-nl-cjscp-org-uk-configuration.content).A
  zone_name           = yamldecode(data.local_file.sandbox-dev-nl-cjscp-org-uk-configuration.content).name
  vnet_links          = yamldecode(data.local_file.sandbox-dev-nl-cjscp-org-uk-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
