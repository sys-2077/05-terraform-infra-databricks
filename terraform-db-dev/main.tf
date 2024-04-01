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


resource "databricks_directory" "this" {
  path = "/dbfs/scripts"
}