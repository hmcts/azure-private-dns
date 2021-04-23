variable "resource_group_name" {
  type        = string
  description = "Name of the resource group that contains the DNS zones."
  default     = "core-infra-intsvc-rg"
}

variable "env" {
  default = "ldata"
}
