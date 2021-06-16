data "local_file" "synapse-dev-private-link" {
  filename = "${path.cwd}/../../environments/privatelink/synapse-dev-private-link.yml"
}

module "synapse-dev-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.synapse-dev-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.synapse-dev-private-link.content).A
  zone_name           = yamldecode(data.local_file.synapse-dev-private-link.content).name
  vnet_links          = yamldecode(data.local_file.synapse-dev-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
}
