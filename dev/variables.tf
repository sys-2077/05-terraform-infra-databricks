#variable "resource_group_name" {}
#variable "location" {}

variable "state_key" {
  type        = string
  description = "La clave para el estado de Terraform en el almacenamiento."
}

variable "workspace_name" {
  type        = string
  description = "Nombre del workspace de Databricks"
}

variable "workspace_sku" {
  type        = string
  description = "SKU del workspace de Databricks"
  default     = "standard"
}

variable "cluster_name" {
  type        = string
  description = "Nombre del cluster de Databricks"
}

variable "spark_version" {
  type        = string
  description = "Versión de Spark para el cluster"
}

variable "node_type_id" {
  type        = string
  description = "Tipo de nodo para el cluster"
}

variable "autotermination_minutes" {
  type        = number
  description = "Minutos de inactividad antes de terminar el cluster"
}

variable "num_workers" {
  type        = number
  description = "Número de nodos worker para el cluster"
}