# Configure Azure provider
provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
    name        = "rg-terraform-import"
    location    = "eastus2"   
}

# terraform import azurerm_resource_group.rg /subscriptions/8fd6c78e-0207-43f0-95c3-591aec55eb89/resourceGroups/rg-terraform-import