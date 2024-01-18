# Within this file you should first define the Azure provider block to enable authentication to Azure 
# using your service principal credentials. 
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id //enter your service principal id
  client_secret   = var.client_secret //enter your service principal secret
  subscription_id = var.subscription_id //enter your subscription id
  tenant_id       = var.tenant_id //enter your tenant id
}
# Remember to define input variables for the client_id and client_secret arguments in a variables.tf file, 
# and then create equivalent environment variables to store the values without exposing your credentials.
module "networking" {
  source = "./modules/networking-module"

  # Input variables for the networking module
  resource_group_name = "networking-rg"
  location           = "UK South"
  vnet_address_space = ["10.0.0.0/16"]

}
module "aks_cluster" {
  source = "./modules/aks-cluster-module"

  # Input variables for the AKS cluster module
  aks_cluster_name           = "terraform-aks-cluster"
  cluster_location           = "UK South"
  dns_prefix                 = "myaks-project"
  kubernetes_version         = "1.26.6"
  service_principal_client_id = var.client_id
  service_principal_client_secret = var.client_secret

  # Input variables referencing outputs from the networking module
  resource_group_name         = module.networking.networking_resource_group_name
  vnet_id                     = module.networking.vnet_id
  control_plane_subnet_id     = module.networking.control_plane_subnet_id
  worker_node_subnet_id       = module.networking.worker_node_subnet_id
  aks_nsg_id                  = module.networking.aks_nsg_id
}