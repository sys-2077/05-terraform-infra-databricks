terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

    databricks = {
      source  = "hashicorp/databricks"
      version = "~> 0.3.2"  # Reemplaza con la versión deseada
    }
  }
}
