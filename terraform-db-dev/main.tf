resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_databricks_workspace" "this" {
  name                        = "db-workspace"
  resource_group_name         = azurerm_resource_group.this.name
  location                    = azurerm_resource_group.this.location
  sku                         = "standard"
  managed_resource_group_name = "db-workspace-rg2"

  tags = {
    environment = var.environment
  }
}

resource "azurerm_databricks_cluster" "this" {
  cluster_name            = "democluster"
  node_type_id            = "Standard_DS3_v2"
  spark_version           = "7.3.x-scala2.12"
  autotermination_minutes = 30
  autoscale {
    min_workers = 1
    max_workers = 3
  }
  spark_conf = {
    "spark.databricks.delta.preview.enabled" = "true"
  }
  custom_tags = {
    environment = var.environment
  }
  depends_on = [azurerm_databricks_workspace.this]
}