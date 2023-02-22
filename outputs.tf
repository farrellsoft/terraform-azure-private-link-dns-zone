
output id {
  value           = azurerm_private_dns_zone.this.id
  description     = "The ID of the Private DNS Zone."
}

output name {
  value           = azurerm_private_dns_zone.this.name
  description     = "The Name of the Private DNS Zone."
}