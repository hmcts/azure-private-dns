# Internal DNS

Azure Private DNS terraform module for deployment of internal DNS zones


# Creating New DNS Zones

To create a new DNS zone add a new terraform definition to the components in the target environment
and add the related data to a zone file in the environments dir. The existing sandbox zones can be used 
as an example.


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
