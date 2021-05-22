
rg_name         = "rg-network"
location        = "eastus"
vnet_name       = "vnet-dev"
vnet_range      = ["10.0.0.0/16"]
subnet_ranges   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
subnet_names    = ["apps", "databases", "web"]
