variable "resource_group_name" {
  type        = string
  description = "Nombre del grupo de recursos para el estado de Terraform"
}

variable "storage_account_name" {
  type        = string
  description = "Nombre de la cuenta de almacenamiento para el estado de Terraform"
}

variable "container_name" {
  type        = string
  description = "Nombre del contenedor para el estado de Terraform"
}

variable "location" {
  type        = string
  description = "Región de Azure para los recursos de Databricks"
}

variable "workspace_name" {
  type        = string
  description = "Nombre del espacio de trabajo de Databricks"
}

variable "cluster_name" {
  type        = string
  description = "Nombre del cluster de Databricks"
}

variable "spark_version" {
  type        = string
  description = "Versión de Spark para el cluster de Databricks"
}

variable "node_type_id" {
  type        = string
  description = "Tipo de nodo para el cluster de Databricks"
}

variable "autotermination_minutes" {
  type        = number
  description = "Minutos de inactividad antes de terminar el cluster de Databricks"
}

variable "num_workers" {
  type        = number
  description = "Número de nodos worker para el cluster de Databricks"
}