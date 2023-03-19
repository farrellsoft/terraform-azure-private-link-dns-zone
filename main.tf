
#resource azurerm_private_dns_zone this {
#  name                = local.zone_mapping[lower(var.resource_type)]
#  resource_group_name = var.resource_group_name
#}

#resource azurerm_private_dns_zone_virtual_network_link this {
#  name                  = "link-${lower(var.resource_type)}"
#  resource_group_name   = var.resource_group_name
#  private_dns_zone_name = azurerm_private_dns_zone.this.name
#  virtual_network_id    = var.virtual_network_id
#}

terraform {
  required_providers {
    azapi = {
      source = "Azure/azapi"
    }
  }
}

data azurerm_client_config current {}

locals {
  resource_group_id     = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.resource_group_name}"
}

resource azapi_resource this {
  type              = "Microsoft.Network/privateDnsZones@2020-06-01"
  name              = local.zone_mapping[lower(var.resource_type)]
  parent_id         = local.resource_group_id
  location          = "global"
}

resource azapi_resource this_link {
  type              = "Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01"
  name              = "link-${lower(var.resource_type)}"
  parent_id         = azapi_resource.this.id
  location          = "global"

  body          = jsonencode({
    properties        = {
      virtualNetwork = {
        id = var.virtual_network_id
      }
      registrationEnabled = false
    }
  })
}