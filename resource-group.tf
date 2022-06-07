# Creates a resource group in your Azure account.

resource "azurerm_resource_group" "iac_example_1" {
  name     = var.app_name
  location = var.location
}
