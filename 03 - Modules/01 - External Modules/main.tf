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

resource "azurerm_resource_group" "rg_vnet" {
  name     = "demo-3.1"
  location = "eastus2"
}

# Module terraform-azurerm-vnet
# https://registry.terraform.io/modules/Azure/vnet/azurerm/latest

module "vnet" {

    source                  = "Azure/vnet/azurerm"
    resource_group_name     = azurerm_resource_group.rg_vnet.name
    vnet_name               = "vnet-dev"
    address_space           = ["10.0.0.0/16"]
    subnet_prefixes         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    subnet_names            = ["apps", "databases", "web"]

    tags    = {
        Environment = "Development"
    }
    
    # Explicit dependency
    depends_on = [azurerm_resource_group.rg_vnet]

}

# Outputs
output "vnet_id" {
    value = module.vnet.vnet_id
}