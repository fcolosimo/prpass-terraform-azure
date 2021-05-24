terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "2.40.0"
        }
    }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "demo-3.2"
  location = "eastus2"
}

# Create Storage Account
module "storage_account1" {
  source    = "./modules/storage-account"

  saname    = "storageprpassdemo1"
  rgname    = azurerm_resource_group.rg.name
  location  = azurerm_resource_group.rg.location
}


# Create Storage Account
module "storage_account2" {
  source    = "./modules/storage-account"

  saname    = "storageprpassdemo2"
  rgname    = azurerm_resource_group.rg.name
  location  = azurerm_resource_group.rg.location
}

