## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.83 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 2.83 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster_node_pool.user](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kubernetes_cluster_id"></a> [kubernetes\_cluster\_id](#input\_kubernetes\_cluster\_id) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"westeurope"` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | n/a | `number` | `100` | no |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | n/a | <pre>map(object({<br>    vm_size                  = string<br>    node_count               = string<br>    availability_zones       = list(any)<br>    enable_node_public_ip    = bool<br>    node_public_ip_prefix_id = string<br>    node_labels              = map(any)<br>    node_taints              = list(any)<br>    enable_host_encryption   = bool<br>  }))</pre> | `{}` | no |
| <a name="input_orchestrator_version"></a> [orchestrator\_version](#input\_orchestrator\_version) | Specify which Kubernetes release to use for the orchestration layer. The default used is the latest Kubernetes version available in the region | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Any tags can be set | `map(string)` | `{}` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
