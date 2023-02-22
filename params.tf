
variable resource_type {
  type        = string
  description = "The type of resource to create"
}

variable resource_group_name {
  type        = string
  description = "The name of the resource group in which to create the resources"
}

variable virtual_network_id {
  type            = string
  description     = "The ID of the virtual network to link to the Private DNS Zone"
}