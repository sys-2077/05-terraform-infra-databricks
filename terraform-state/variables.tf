variable "resource_group_name" {
  type        = string
  description = "El nombre del grupo de recursos donde se crearán los recursos."
}

variable "location" {
  type        = string
  description = "La ubicación donde se crearán los recursos."
}

variable "storage_account_name" {
  type        = string
  description = "El nombre de la cuenta de almacenamiento."
}

variable "container_name" {
  type        = string
  description = "El nombre del contenedor de almacenamiento."
}