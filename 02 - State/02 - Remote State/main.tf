# Terraform
terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "2.40.0"
        }
    }

    backend "azurerm" {
        resource_group_name  = "rg-terraform-state"
        storage_account_name = "prpassterraformstate"
        container_name       = "state"
        key                  = "dev.terraform.tfstate"
    }
}

#Azure provider
provider "azurerm" {
    features {}
}


resource "azurerm_resource_group" "rg" {
    name        = "demo-2.2"
    location    = "eastus2"   

    tags        = {
        Environment = "Development"
    }
}

resource "azurerm_subnet" "subnet" {
    name                 = "default"
    resource_group_name  = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes       = ["10.0.0.0/24"]
}

resource "azurerm_virtual_network" "vnet" {
    name                = "vnet-dev"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}