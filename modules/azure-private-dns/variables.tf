variable "location" {
  description = "azure resource location"
  default     = "UK South"
  type        = string
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group that contains the DNS zones."
}

variable "zone_name" {
  description = "DNS zone to manage"
}

variable "vnet_links" {
  type    = list(any)
  default = []
}

variable "cname_records" {
  type = list(object({
    name   = string
    ttl    = number
    record = string
  }))

  default = []
}

variable "a_recordsets" {
  type = list(object({
    name   = string
    ttl    = number
    record = list(string)
  }))

  default = []
}

variable "env" {}

variable "builtFrom" {
  default = "hmcts/azure-private-dns"
}

variable "product" {
  default = "cft-platform"
}

variable "create_zone" {
  default = true
}

variable "expiresAfter" {
  description = "Date when Sandbox resources can be deleted. Format: YYYY-MM-DD"
  default     = "3000-01-01"
}