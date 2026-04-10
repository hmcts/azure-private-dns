env = "ithc"

# Cross-tenant SPN context (f161cfe9) for crime-idam postgres DNS links
cross_tenant_subscription_id = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
cross_tenant_tenant_id       = "531ff96d-0ae9-462a-8d2d-bec7c0b42082"
cross_tenant_client_id       = "f161cfe9-2788-453f-8821-5203a0a37263"

# Secret sourced from central-app-reg-kv (nonlive-crime-idam-cross-tenant-secret) via AzureKeyVault@2 pipeline task

# Crime tenant ID (cp.cjs.hmcts.net) used as auxiliary tenant for cross-tenant VNet link resolution
cross_tenant_auxiliary_tenant_ids = ["77f54315-6dde-4fe7-9e17-74762c3eb096"]