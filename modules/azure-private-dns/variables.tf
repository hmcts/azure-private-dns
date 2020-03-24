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
  default     = []
}

variable "vnet_links" {
  default = []
}

variable "cname_records" {
  default = []
}

variable "a_recordsets" {
  default = []
}

variable "env" {}
