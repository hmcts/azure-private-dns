# Internal DNS

Azure Private DNS terraform module for deployment of internal DNS zones


# Creating New DNS Zones

To create a new DNS zone add a new terraform definition to the components in the target environment
and add the related data to a zone file in the environments dir. The existing sandbox zones can be used 
as an example.


# Role Assignments

The module supports granting `Private DNS Zone Contributor` to one or more principals on a zone.
Pass a list of principal (object) IDs via the `zone_contributors` variable on any module call:

```hcl
module "example-private-link" {
  source              = "../../modules/azure-private-dns/"
  zone_name           = "privatelink.example.azure.net"
  resource_group_name = var.resource_group_name
  env                 = var.env

  zone_contributors = [
    data.azuread_service_principal.my_spn.object_id,
  ]
}
```

The variable defaults to `[]`, so it is optional for zones that don't require any role assignments.
The role is fixed at `Private DNS Zone Contributor` — only the principal IDs need to be supplied.

Components that use `zone_contributors` must declare the `azuread` provider:

```hcl
provider "azuread" {}

terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.9.0"
    }
  }
}
```


# Importing existing Consul records

After creating the Private DNS zones, you can run the `./consul_records.py` script to import existing Consul (in the scripts directory).
A and CNAME records. Run `./consul_records.py` with no arguments to see the options
