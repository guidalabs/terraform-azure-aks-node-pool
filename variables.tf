variable "node_pools" {
  type = map(object({
    vm_size                  = string
    node_count               = string
    availability_zones       = list(any)
    enable_node_public_ip    = bool
    node_public_ip_prefix_id = string
    node_labels              = map(any)
    node_taints              = list(any)
    enable_host_encryption   = bool
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

variable "max_pods" {
  type    = number
  default = 100
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
