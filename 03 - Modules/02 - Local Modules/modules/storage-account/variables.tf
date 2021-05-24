variable "saname" {
    type = string
    description = "Name"
}
variable "rgname" {
    type = string
    description = "Resource Group Name"
}
variable "location" {
    type = string
    description = "Azure location"
    default = "eastus2"
}