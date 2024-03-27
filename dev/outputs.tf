output "databricks_workspace_url" {
  value       = azurerm_databricks_workspace.dev.workspace_url
  description = "URL del workspace de Databricks en dev"
}

output "databricks_cluster_id" {
  value       = databricks_cluster.dev.id
  description = "ID del cluster de Databricks en dev"
}