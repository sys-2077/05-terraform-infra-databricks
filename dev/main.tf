data "terraform_remote_state" "state" {
  backend = "azurerm"
  config = {
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "dev" {
  name     = "rg-databricks-dev"
  location = var.location
}

resource "azurerm_databricks_workspace" "dev" {
  name                = var.workspace_name
  resource_group_name = azurerm_resource_group.dev.name
  location            = azurerm_resource_group.dev.location
  sku                 = "standard"
}

resource "databricks_cluster" "dev" {
  cluster_name            = var.cluster_name
  spark_version           = var.spark_version
  node_type_id            = var.node_type_id
  autotermination_minutes = var.autotermination_minutes
  num_workers             = var.num_workers

  azure_attributes {
    resource_group = azurerm_resource_group.dev.name
    workspace_name = azurerm_databricks_workspace.dev.name
  }
}