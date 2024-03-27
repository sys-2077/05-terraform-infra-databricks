data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "dev" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_databricks_workspace" "dev" {
  name                = var.workspace_name
  resource_group_name = azurerm_resource_group.dev.name
  location            = azurerm_resource_group.dev.location
  sku                 = var.workspace_sku
}

resource "databricks_cluster" "dev" {
  provider                = databricks.dev
  cluster_name            = var.cluster_name
  spark_version           = var.spark_version
  node_type_id            = var.node_type_id
  autotermination_minutes = var.autotermination_minutes
  num_workers             = var.num_workers
}

module "terraform_state" {
  source = "../terraform-state"
  resource_group_name = var.resource_group_name
}

terraform {
  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = module.terraform_state.storage_account_name
    container_name       = module.terraform_state.container_name
    key                  = var.state_key
  }
}