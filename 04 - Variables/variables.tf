
variable "rg_name" {
    type = string
    description = "Resource Group Name"
}

variable "location" {
    type = string
    description = "Azure Location"
    default = "eastus"
}

variable "vnet_name" {
    type = string
    description = "Virtual Network Name"
}

variable "vnet_address_space" {
    description = "Virtual Network Address Space"
    type = list(string)
}

variable "subnet_ranges" {
    description = "Subnets Address Space"
    type = list(string)
}

variable "subnet_names" {
    description = "Subnets Names"
    type = list(string)
}