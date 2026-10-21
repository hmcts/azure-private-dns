env = "ithc"

## Secrets sourced from central-app-reg-kv ((non)live-crime-idam-cross-tenant-secret) via pipeline task

# Nonlive cross-tenant SPN context (f161cfe9) for crime-idam postgres DNS links
cross_tenant_nonlive_subscription_id = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
cross_tenant_nonlive_tenant_id       = "531ff96d-0ae9-462a-8d2d-bec7c0b42082"
cross_tenant_nonlive_client_id       = "f161cfe9-2788-453f-8821-5203a0a37263"
cross_tenant_nonlive_auxiliary_tenant_ids = ["e2995d11-9947-4e78-9de6-d44e0603518e"]

# HMCTS Live (Strategic) tenant detail
cross_tenant_live_subscription_id      = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
cross_tenant_live_tenant_id            = "531ff96d-0ae9-462a-8d2d-bec7c0b42082"
cross_tenant_live_auxiliary_tenant_ids = ["77f54315-6dde-4fe7-9e17-74762c3eb096"]