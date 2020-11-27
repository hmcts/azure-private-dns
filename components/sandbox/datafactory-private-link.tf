data "local_file" "datafactory-factory-private-link" {
  filename = "${path.cwd}/../../environments/sandbox/datafactory-factory-private-link.yml"
}

module "datafactory-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.datafactory-factory-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.datafactory-factory-private-link.content).A
  zone_name           = yamldecode(data.local_file.datafactory-factory-private-link.content).name
  vnet_links          = yamldecode(data.local_file.datafactory-factory-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
}
