# terraform-azure aks-node-pool

In AKS, nodes of the same configuration are grouped together into node pools. These node pools contain the underlying VMs that where containerized workloads are scheduled on.

This module contains one terraform resource, but allows you to create multiple node pools with a `for_each`. This module depends on the module/resource that creates an AKS cluster.

## Usage

```hcl
module "aks-node-pool" {
  source                = "guidalabs/terraform-azure-aks-node-pool"
  resource_group_name   = azurerm_resource_group.main.name
  orchestrator_version  = 1.21.2
  location              = var.location
  vnet_subnet_id        = module.network.vnet_subnets[0]
  kubernetes_cluster_id = module.aks.aks_id
  node_pools = {
    user1 = {
      vm_size                  = "Standard_A2_v2"
      priority                 = "Regular"
      eviction_policy          = ""
      enable_auto_scaling      = false
      os_disk_size_gb          = 50
      os_disk_type             = "Managed"
      node_count               = 2
      min_count                = 2
      max_count                = 2
      availability_zones       = ["1", "2", "3"]
      enable_node_public_ip    = true # if set to true node_public_ip_prefix_id is required
      node_public_ip_prefix_id = module.public-ip-prefix.prefix_id[0]
      node_labels              = { "workload" = "example-public" }
      node_taints              = ["workload=example:NoSchedule"]
      enable_host_encryption   = false
      max_pods                 = 50
    },
    user2 = {
      vm_size                  = "Standard_A2_v2"
      priority                 = "Regular"
      enable_auto_scaling      = false
      os_disk_size_gb          = 50
      os_disk_type             = "Managed"
      node_count               = 2
      min_count                = 2
      max_count                = 2
      availability_zones       = ["1", "2", "3"]
      enable_node_public_ip    = true
      node_public_ip_prefix_id = module.public-ip-prefix.prefix_id[1]
      node_labels              = { "workload" = "example2-public" }
      node_taints              = ["workload=example2:NoSchedule"]
      enable_host_encryption   = false
      max_pods                 = 50
    },
    user3 = {
      vm_size                  = "Standard_A2_v2"
      priority                 = "Spot" # Spot instances
      eviction_policy          = "Delete"
      enable_auto_scaling      = false
      os_disk_size_gb          = 50
      os_disk_type             = "Ephemeral"
      node_count               = 3
      min_count                = 3
      max_count                = 3
      availability_zones       = ["1", "2", "3"]
      enable_node_public_ip    = false
      node_public_ip_prefix_id = ""
      node_labels              = { "kubernetes.azure.com/scalesetpriority" = "spot" }
      node_taints              = ["kubernetes.azure.com/scalesetpriority=spot:NoSchedule"]
      enable_host_encryption   = false
      max_pods                 = 100
    },
  }
}
```
