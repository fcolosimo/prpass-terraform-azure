# Terraform
terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "2.40.0"
        }
    }
}

# Configure Azure provider
provider "azurerm" {
    features {}
}

# Create resource group
resource "azurerm_resource_group" "rg" {
    name     = "demo-2.1"
    location = "eastus2"
    tags = {
        Environment = "Development"
    }
}

# Create App Service Plan
resource "azurerm_app_service_plan" "asp" {
  name                = "terraform-appserviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Create App Service
resource "azurerm_app_service" "app" {
  name                = "terraform-prpass-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "DOTNETCORE|5.0"
    dotnet_framework_version = "v5.0"
  }

  app_settings = {
    "ASPNETCORE_ENVIRONMENT" = "Stage"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=10.0.0.4;Integrated Security=SSPI"
  }
}
