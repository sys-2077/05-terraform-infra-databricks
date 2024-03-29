output "databricks_workspace_url" {
  value       = azurerm_databricks_workspace.dev.workspace_url
  description = "URL del espacio de trabajo de Databricks para el entorno de desarrollo"
}

output "databricks_workspace_id" {
  value       = azurerm_databricks_workspace.dev.id
  description = "ID del espacio de trabajo de Databricks para el entorno de desarrollo"
}

output "databricks_cluster_id" {
  value       = databricks_cluster.dev.id
  description = "ID del cluster de Databricks para el entorno de desarrollo"
}