
variable "rg_name" {
    type = string
}

variable "location" {
    type = string
    default = "eastus"
}

variable "vnet_name" {
    type = string
    default = "10.0.0.0/16"
}

variable "vnet_range" {
    type = list(string)
}

variable "subnet_ranges" {
    type = list(string)
}

variable "subnet_names" {
    type = list(string)
}