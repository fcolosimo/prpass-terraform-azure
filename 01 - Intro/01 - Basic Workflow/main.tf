
provider "azurerm" {
    features {
    }
}

resource "azurerm_resource_group" "rg" {
    name        = "demo-1.1"
    location    = "eastus2"   

    tags        = {
      Environment = "Development",
    }
}
