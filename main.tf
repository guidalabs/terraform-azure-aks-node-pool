resource "azurerm_kubernetes_cluster_node_pool" "user" {
  for_each                 = var.node_pools
  name                     = each.key
  kubernetes_cluster_id    = var.kubernetes_cluster_id
  orchestrator_version     = var.orchestrator_version
  vm_size                  = each.value.vm_size
  os_disk_size_gb          = each.value.os_disk_size_gb
  os_disk_type             = each.value.os_disk_type
  node_count               = each.value.node_count
  min_count                = each.value.min_count
  max_count                = each.value.max_count
  priority                 = each.value.priority
  vnet_subnet_id           = var.vnet_subnet_id
  availability_zones       = each.value.availability_zones
  enable_auto_scaling      = each.value.enable_auto_scaling
  enable_node_public_ip    = each.value.enable_node_public_ip
  node_public_ip_prefix_id = each.value.node_public_ip_prefix_id
  node_labels              = each.value.node_labels
  node_taints              = each.value.node_taints
  enable_host_encryption   = each.value.enable_host_encryption
  max_pods                 = each.value.max_pods

  tags = var.tags
}