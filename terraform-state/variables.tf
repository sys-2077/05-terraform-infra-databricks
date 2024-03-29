variable "resource_group_name" {
  type        = string
  description = "Resources group where will be created."
}

variable "location" {
  type        = string
  description = "Region where will be created"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account Name."
}

variable "container_name" {
  type        = string
  description = "Storage Container Name"
}