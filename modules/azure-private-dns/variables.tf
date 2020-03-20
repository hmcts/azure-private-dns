variable "location" {
  description = "azure resource location"
  default     = "UK South"
  type        = string
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group that contains the DNS zones."
}

variable "zone_names" {
  description = "List of DNS zones to manage"
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
