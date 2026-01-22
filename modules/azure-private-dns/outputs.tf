output "vnet_link_ids" {
  description = "Map of Private DNS zone virtual network link resource IDs, keyed by link_name."
  value       = { for link_name, link in azurerm_private_dns_zone_virtual_network_link.vnet_link : link_name => link.id }
}
