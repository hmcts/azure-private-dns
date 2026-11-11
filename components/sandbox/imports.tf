# Records that already existed in Azure before they were added to the zone files.
# Safe to delete once the import has been applied.

# amp-marketplace-web.sandbox.platform.hmcts.net was created by hand as a CNAME to the sandbox Front Door.
import {
  to = module.sandbox-platform.azurerm_private_dns_cname_record.this["amp-marketplace-web"]
  id = "/subscriptions/1497c3d7-ab6d-4bb7-8a10-b51d03189ee3/resourceGroups/core-infra-intsvc-rg/providers/Microsoft.Network/privateDnsZones/sandbox.platform.hmcts.net/CNAME/amp-marketplace-web"
}
