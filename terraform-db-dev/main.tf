resource "azurerm_resource_group" "dev" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_storage_account" "dev" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.dev.name
  location                 = azurerm_resource_group.dev.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}