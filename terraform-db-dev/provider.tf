terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.72.0"
    }

    databricks = {
      source  = "hashicorp/databricks"
      version = "1.27.0"
    }
  }
}
