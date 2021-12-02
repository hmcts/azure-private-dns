data "local_file" "dfs-private-link" {
  filename = "${path.cwd}/../../environments/privatelink/dfs-private-link.yml"
}

module "dfs-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.dfs-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.dfs-private-link.content).A
  zone_name           = yamldecode(data.local_file.dfs-private-link.content).name
  vnet_links          = yamldecode(data.local_file.dfs-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
}
