terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.72.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "1.39.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.43.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}


provider "databricks" {
  host = azurerm_databricks_workspace.this.workspace_url
  azure_workspace_resource_id = azurerm_databricks_workspace.this.id
}