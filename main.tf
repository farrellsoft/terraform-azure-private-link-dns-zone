
resource azurerm_private_dns_zone this {
  name                = local.zone_mapping[lower(var.resource_type)]
  resource_group_name = var.resource_group_name
}

resource azurerm_private_dns_zone_virtual_network_link this {
  name                  = "link-${lower(var.resource_type)}"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = var.virtual_network_id
}