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
    name     = "demo-1.3"
    location = "eastus2"
    tags = {
        Environment = "Development"
    }
}

#Create virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "vnet-dev"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}

# Create subnet
resource "azurerm_subnet" "subnet" {
    name                 = "default"
    resource_group_name  = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = ["10.0.0.0/24"]
}


# Create network interface
resource "azurerm_network_interface" "nic" {
    name                      = "nic"
    location                  = azurerm_resource_group.rg.location
    resource_group_name       = azurerm_resource_group.rg.name

    ip_configuration {
        name                          = "niccfg-vmterraform"
        subnet_id                     = azurerm_subnet.subnet.id
        private_ip_address_allocation = "dynamic"
    }
}

# Create virtual machine
resource "azurerm_windows_virtual_machine" "vm" {
    name                  = "vmdemoterraform"
    location              = azurerm_resource_group.rg.location
    resource_group_name   = azurerm_resource_group.rg.name
    network_interface_ids = [azurerm_network_interface.nic.id]
    size                  = "Standard_B1s"
    admin_username        = "terradamin"
    admin_password        = "Password@01"

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2016-Datacenter"
        version   = "latest"
    }

}