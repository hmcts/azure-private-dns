variable "resource_group_name" {
  type        = string
  description = "Name of the resource group that contains the DNS zones."
  default     = "core-infra-intsvc-rg"
}

variable "env" {
  default = "ithc"
}

variable "product" {
  type        = string
  description = "Name of the product. This is used in tags"
}

variable "builtFrom" {
  type        = string
  description = "Name of the deployment pipeline. This is used in tags"
}

variable "cross_tenant_subscription_id" {
  type        = string
  description = "Subscription ID where private DNS zone updates are applied by the cross-tenant SPN"
}

variable "cross_tenant_tenant_id" {
  type        = string
  description = "Home tenant ID for the cross-tenant SPN"
}

variable "cross_tenant_client_id" {
  type        = string
  description = "Application (client) ID for the cross-tenant SPN"
}

variable "cross_tenant_client_secret" {
  type        = string
  description = "Client secret for the cross-tenant SPN"
  default     = ""
  sensitive   = true
}

variable "cross_tenant_auxiliary_tenant_ids" {
  type        = list(string)
  description = "Auxiliary tenant IDs required to resolve cross-tenant VNet links (e.g. crime tenant)"
  default     = []
}
