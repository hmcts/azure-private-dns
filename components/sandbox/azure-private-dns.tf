locals {
  zone_vnet_links = flatten([
    for dns_zone in yamldecode(data.local_file.configuration.content).zone: [
      for vnet_link in dns_zone.vnet_links: {
        vnet_link.zone_name = dns_zone.name
      }
    ]
  ])

  zone_a_records = flatten([
    for dns_zone in yamldecode(data.local_file.configuration.content).zone: [
      for a_rec in dns_zone.A: {
        a_rec.zone_name = dns_zone.name
      }
    ]
  ])

  zone_cnames = flatten([
    for dns_zone in yamldecode(data.local_file.configuration.content).zone: [
      for cname in dns_zone.cname: {
        cname.zone_name = dns_zone.name
      }
    ]
  ])
}

module "private-dns" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = local.zone_cnames
  a_recordsets        = local.zone_a_records
  zone_names          = yamldecode(data.local_file.configuration.content).zone.name
  vnet_links          = local.zone_vnet_links
  resource_group_name = data.azurerm_resource_group.main.name
  env                 = "sbox"
}
