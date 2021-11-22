
# Docs
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool
variable "node_pools" {
  type = map(object({
    vm_size                  = string
    os_disk_size_gb          = number
    os_disk_type             = string
    node_count               = string
    max_count                = number
    min_count                = number
    priority                 = string
    eviction_policy          = string
    availability_zones       = list(any)
    enable_auto_scaling      = bool
    enable_node_public_ip    = bool
    node_public_ip_prefix_id = string
    node_labels              = map(any)
    node_taints              = list(any)
    enable_host_encryption   = bool
    max_pods                 = number
  }))
  default = {}
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "kubernetes_cluster_id" {
  type = string
}

variable "vnet_subnet_id" {
  type = string
}

variable "orchestrator_version" {
  description = "Specify which Kubernetes release to use for the orchestration layer. The default used is the latest Kubernetes version available in the region"
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Any tags can be set"
  default     = {}
}
