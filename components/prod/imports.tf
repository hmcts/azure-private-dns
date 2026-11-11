# Records that already existed in Azure before they were added to the zone files.
# Safe to delete once the import has been applied.

# amp-marketplace.platform.hmcts.net was created by hand as a CNAME to the prod Front Door.
# Imported only so Terraform can delete it in the next change.
import {
  to = module.prod-platform.azurerm_private_dns_cname_record.this["amp-marketplace"]
  id = "/subscriptions/1baf5470-1c3e-40d3-a6f7-74bfbce4b348/resourceGroups/core-infra-intsvc-rg/providers/Microsoft.Network/privateDnsZones/platform.hmcts.net/CNAME/amp-marketplace"
}
