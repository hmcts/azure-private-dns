output "private_dns_zone_id" {
  description = "The ARM resource ID of the Private DNS zone (created or referenced by this module)."
  value       = azurerm_private_dns_zone.zone[0].id
}
