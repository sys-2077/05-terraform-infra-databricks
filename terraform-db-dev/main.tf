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



resource "databricks_dbfs_directory" "this" {
  depends_on = [azurerm_databricks_workspace.this]

  path = "/dbfs/scripts"
}
