# Temporary just to allow Terraform to manage this resource and resolve conflict
# Will be removed in subsequent PR after Apply operation has been run
import {
  id = "/subscriptions/1baf5470-1c3e-40d3-a6f7-74bfbce4b348/resourceGroups/core-infra-intsvc-rg/providers/Microsoft.Network/privateDnsZones/private.postgres.database.azure.com/virtualNetworkLinks/migration-vnet-prod"
  to = module.postgres.azurerm_private_dns_zone_virtual_network_link.vnet_link["darts-prod-vnet"]
}