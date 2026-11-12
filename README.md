# Internal DNS

Azure Private DNS terraform module for deployment of internal DNS zones


# CP staging AI Gateway

CP clients use the hostname for their reachable private endpoint. All names below are
in `staging.platform.hmcts.net` and target the same staging Application Gateway.

| Record | Private endpoint VNet |
|---|---|
| `ai-gateway-cpp-nft-01` | `VN-NFT-SVC-01` |
| `ai-gateway-cpp-nft-02` | `VN-NFT-SVC-02` |
| `ai-gateway-cpp-sit` | `VN-SIT-SVC-01` |
| `ai-gateway-cpp-ste` | `VN-STE-SVC-01` |
| `ai-gateway-cpp-mdv` | `VN-MNL-INT-01` |

The staging component links the zone to these five VNets using
`crime-ai-gateway-cross-tenant-peering-nonprod`. Its secret is supplied by the
pipeline from `central-app-reg-kv`; its DNS-subscription Reader and CP VNet
read/join permissions must be deployed before running the cross-tenant pipeline.

Keep the records in `environments/staging/staging-platform-hmcts-net.yml` aligned
with the deployed private endpoint IPs after endpoint recreation. DNS links do
not provide network access or extend DNS resolution to peered VNets: AKS and
other callers outside the linked VNets need their own DNS link or forwarding
path as well as connectivity to the selected endpoint.


# Creating New DNS Zones

To create a new DNS zone add a new terraform definition to the components in the target environment
and add the related data to a zone file in the environments dir. The existing sandbox zones can be used 
as an example.


# Role Assignments

The module supports granting `Private DNS Zone Contributor` to one or more principals on a zone.
Contributors are defined in the zone's YAML file in the `environments` directory and looked up by
display name at plan time. The `contributors` key is optional — omit it for zones that need no role assignments.

In the zone YAML:

```yaml
name: "privatelink.example.azure.net"
contributors:
  - "My SPN Display Name"
vnet_links:
  ...
A: []
cname: []
```

In the component `.tf` file:

```hcl
data "azuread_service_principal" "example_contributors" {
  for_each     = toset(try(yamldecode(data.local_file.example.content).contributors, []))
  display_name = each.value
}

module "example-private-link" {
  source              = "../../modules/azure-private-dns/"
  zone_name           = yamldecode(data.local_file.example.content).name
  resource_group_name = var.resource_group_name
  env                 = var.env

  zone_contributors = values(data.azuread_service_principal.example_contributors)[*].object_id
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


# APIM Marketplace Private DNS Skeleton

APIM Marketplace private DNS zones use this naming convention under `internal.hmcts.net`:

- `<environment>.api.internal.hmcts.net`

Provisioned skeleton environments:

- `sandbox.api.internal.hmcts.net`
- `ithc.api.internal.hmcts.net`
- `perftest.api.internal.hmcts.net`
- `demo.api.internal.hmcts.net`
- `preview.api.internal.hmcts.net`
- `staging.api.internal.hmcts.net`
- `prod.api.internal.hmcts.net`

Record pattern for future services is consistent across environments:

- `<service>.<environment>.api.internal.hmcts.net`

The skeleton zones are created with empty `A` and `cname` lists so APIM/App Gateway and other future records can be added without zone restructuring.
