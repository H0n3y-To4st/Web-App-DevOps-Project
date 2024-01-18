# name of the resource group
variable "resource_group_name" {
  type    = string
  default = "azureProjectResourceGroup"
}
#where the resources will be stored
variable "location" {
  type    = string
  default = "UK South"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}
