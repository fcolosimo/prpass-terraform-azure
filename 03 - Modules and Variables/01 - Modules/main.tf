terraform {

}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg_vnet" {
  name     = var.rg_name
  location = var.location
}

module "vnet" {

    source                  = "Azure/vnet/azurerm"

    resource_group_name     = azurerm_resource_group.rg_vnet.name
    vnet_name               = var.vnet_name   
    address_space           = var.vnet_range
    subnet_prefixes         = var.subnet_ranges
    subnet_names            = var.subnet_names

    tags    = {
        Environment = "Development"
    }
    
    depends_on = [azurerm_resource_group.rg_vnet]

}


output "vnet_id" {
    value = module.vnet.vnet_id
}