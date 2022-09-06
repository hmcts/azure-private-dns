data "local_file" "mailrelay-configuration" {
  filename = "${path.cwd}/../../environments/prod/mailrelay-platform-hmcts-net.yml"
}

module "mailrelay" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.mailrelay-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.mailrelay-configuration.content).A
  zone_name           = yamldecode(data.local_file.mailrelay-configuration.content).name
  vnet_links          = yamldecode(data.local_file.mailrelay-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}
