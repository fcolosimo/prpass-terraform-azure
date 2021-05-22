
provider "azurerm" {
    features {
    }
}

resource "azurerm_resource_group" "rg" {
    name        = "demo"
    location    = "eastus2"   

    tags        = {
      Environment = "Development",
      "Projec"  = "PRPASS"
    }
}
