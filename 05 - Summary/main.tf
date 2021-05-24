# Terraform Configuration
terraform {

    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "2.40.0"
        }
    }

    # Remote State in Azure Blob Storage
    backend "azurerm" {
        resource_group_name  = "rg-terraform"
        storage_account_name = "prpassterraformstate"
        container_name       = "state"
        key                  = "dev.terraform.tfstate"
    }

    #Terraform required version
    required_version = "0.15.3"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
    name     = var.rg_name
    location = var.location

    tags = var.tags
}

# Virtual Network
module "vnet" {

    source                  = "Azure/vnet/azurerm"
    
    # Interpolation
    resource_group_name     = azurerm_resource_group.rg.name

    vnet_name               = var.vnet_name
    address_space           = var.vnet_address_space
    subnet_prefixes         = var.subnet_ranges
    subnet_names            = var.subnet_names

    tags = var.tags
    
    # Explicit dependency
    depends_on = [azurerm_resource_group.rg]
}


#Windows Server
module "windowsservers" {

    source              = "Azure/compute/azurerm"
    nb_instances        = 2
    resource_group_name = azurerm_resource_group.rg.name
    is_windows_image    = true
    vm_hostname         = var.hostname
    admin_username      = "azurevmadmin"
    admin_password      = var.password
    vm_os_simple        = "WindowsServer"
    public_ip_dns       = [var.publicDomain] 
    vnet_subnet_id      = module.vnet.vnet_subnets[0]

    # Open RDP Port
    remote_port         = var.environment == "Development" ? "3389" : ""
 
    tags = var.tags

    depends_on = [azurerm_resource_group.rg]
}