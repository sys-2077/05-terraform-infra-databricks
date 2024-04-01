resource "azurerm_resource_group" "this" {
  name     = "rg-db-${var.environment}"
  location = var.location
}

resource "azurerm_databricks_workspace" "this" {
  name                        = "db-workspace-${var.environment}"
  resource_group_name         = azurerm_resource_group.this.name
  location                    = azurerm_resource_group.this.location
  sku                         = "standard"
  managed_resource_group_name = "db-sws-${var.environment}"

  tags = {
    environment = var.environment
  }
}

data "databricks_spark_version" "latest" {
  depends_on = [ azurerm_databricks_workspace.this ]
  latest = true
  long_term_support = true
}

resource "databricks_cluster" "this" {
  cluster_name            = "my-cluster-${var.environment}"
  spark_version           = data.databricks_spark_version.latest.id
  node_type_id            = var.node_type
  autotermination_minutes = 30
  autoscale {
    min_workers = 1
    max_workers = var.max_workers
  }
  spark_conf = {
    "spark.databricks.delta.preview.enabled" = "true"
  }
  custom_tags = {
    environment = var.environment
  }
}

resource "databricks_directory" "this" {
  path = "/dbfs/scripts"
}