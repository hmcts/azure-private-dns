data "local_file" "hmcts-net-configuration" {
  filename = "${path.cwd}/../../environments/prod/hmcts-net.yml"
}

module "hmcts-net" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.hmcts-net-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.hmcts-net-configuration.content).A
  zone_name           = yamldecode(data.local_file.hmcts-net-configuration.content).name
  vnet_links          = yamldecode(data.local_file.hmcts-net-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}

import {
  to = module.hmcts-net.azurerm_private_dns_zone_virtual_network_link.vnet_link["atlassian-int-nonprod-vnet"]
  id = "/subscriptions/1baf5470-1c3e-40d3-a6f7-74bfbce4b348/resourceGroups/core-infra-intsvc-rg/providers/Microsoft.Network/privateDnsZones/hmcts.net/virtualNetworkLinks/atlassian-int-nonprod-vnet"
}
