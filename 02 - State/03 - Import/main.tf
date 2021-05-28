# Configure Azure provider
provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
    name        = "rg-terraform-import"
    location    = "eastus2"   
}
