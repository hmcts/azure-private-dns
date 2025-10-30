data "local_file" "test-platform-configuration" {
  filename = "${path.cwd}/../../environments/test/test-platform-hmcts-net.yml"
}

module "test-platform" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.test-platform-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.test-platform-configuration.content).A
  zone_name           = yamldecode(data.local_file.test-platform-configuration.content).name
  vnet_links          = yamldecode(data.local_file.test-platform-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product
}

import {
  to = module.test-platform.azurerm_private_dns_a_record.this["pip-frontend"]
  id = "/subscriptions/1baf5470-1c3e-40d3-a6f7-74bfbce4b348/resourceGroups/core-infra-intsvc-rg/providers/Microsoft.Network/privateDnsZones/test.platform.hmcts.net/A/pip-frontend"
}
