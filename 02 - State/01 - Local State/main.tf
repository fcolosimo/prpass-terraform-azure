# Terraform
terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "2.40.0"
        }
    }
}

#Azure provider
provider "azurerm" {
    features {}
}

#create resource group
resource "azurerm_resource_group" "rg" {
    name     = "demo"
    location = "eastus2"
    tags = {
        Environment = "Development"
    }
}

resource "azurerm_storage_account" "storage" {
  name                     = "demoprpass001"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    Environment = "Development"
  }
}

resource "azurerm_storage_container" "container" {
  name                  = "blobs"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}