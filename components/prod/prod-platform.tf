data "local_file" "platform-configuration-prod" {
  filename = "${path.cwd}/../../environments/prod/prod-platform-hmcts-net.yml"
}

module "platform-prod" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.platform-configuration-prod.content).cname
  a_recordsets        = yamldecode(data.local_file.platform-configuration-prod.content).A
  zone_name           = yamldecode(data.local_file.platform-configuration-prod.content).name
  vnet_links          = yamldecode(data.local_file.platform-configuration-prod.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
}
