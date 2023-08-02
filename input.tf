variable "tenant_id" {
  description = "tenant id"
  default     = ""
  type        = string
}

variable "subscription_id" {
  description = "subscription id"
  default     = ""
  type        = string
}

variable "client_id" {
  description = "client id"
  default     = ""
  type        = string
}

variable "client_secret" {
  description = "client secret"
  default     = ""
  type        = string
}

variable "rg_name" {
  default     = "falcon"
  type        = string
  description = "Name for rg"
}

variable "location" {
  default     = "westus2"
  type        = string
  description = "Location of Azure resources"
}

variable "vnet_name" {
  type        = string
}

variable "vnet_rg" {
  type        = string
}

variable "vm_subnet_name" {
  type        = string
}
