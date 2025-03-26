data "local_file" "machine-learning-private-link" {
  filename = "${path.cwd}/../../environments/privatelink/machine-learning-private-link.yml"
}

module "machine-learning-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.machine-learning-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.machine-learning-private-link.content).A
  zone_name           = yamldecode(data.local_file.machine-learning-private-link.content).name
  vnet_links          = yamldecode(data.local_file.machine-learning-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
}
