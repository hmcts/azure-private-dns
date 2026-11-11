# Records that already existed in Azure before they were added to the zone files.
# Safe to delete once the import has been applied.

# amp-marketplace-web.demo.platform.hmcts.net was created by hand as a CNAME to the demo Front Door.
import {
  to = module.demo-platform.azurerm_private_dns_cname_record.this["amp-marketplace-web"]
  id = "/subscriptions/1baf5470-1c3e-40d3-a6f7-74bfbce4b348/resourceGroups/core-infra-intsvc-rg/providers/Microsoft.Network/privateDnsZones/demo.platform.hmcts.net/CNAME/amp-marketplace-web"
}
