variable "resource_group_name" {
  type        = string
  description = "Name of the resource group that contains the DNS zones."
  default     = "core-infra-intsvc-rg"
}

variable "env" {
  default = "perftest"
}

variable "product" {
  type        = string
  description = "Name of the product. This is used in tags"
}

variable "builtFrom" {
  type        = string
  description = "Name of the deployment pipeline. This is used in tags"
}
