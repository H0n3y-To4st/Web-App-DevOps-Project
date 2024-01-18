# Input variables for AKS cluster
variable "aks_cluster_name" {
    type = string
    description = "variable that represents the name of the AKS cluster you wish to create"
}
variable "cluster_location" {
    type = string
    description = "variable that specifies the Azure region where the AKS cluster will be deployed to"
}
variable "dns_prefix" {
    type = string
    description = "variable that defines the DNS prefix of cluster"
}
variable "kubernetes_version" {
    type = string
    description = "variable that specifies which Kubernetes version the cluster will use"
}
variable "service_principal_client_id" {
    type = string
    description = "variable that provides the Client ID for the service principal associated with the cluster"
}
variable "service_principal_client_secret" {
    type = string
    description = "variable that supplies the Client Secret for the service principal"
}

# Input variables from networking module
variable "resource_group_name" {
    type = string
}
variable "vnet_id" {
    type = string
}
variable "control_plane_subnet_id" {
    type = string
}
variable "worker_node_subnet_id" {
    type = string
}
variable "aks_nsg_id" {
    type = string
}