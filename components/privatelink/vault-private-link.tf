data "local_file" "vault-private-link" {
  filename = "${path.cwd}/../../environments/privatelink/vault-private-link.yml"
}

data "azuread_service_principal" "dts_sps_sbox" {
  display_name = "DTS Bootstrap (sub:dts-sps-sbox)"
}

module "vault-private-link" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.vault-private-link.content).cname
  a_recordsets        = yamldecode(data.local_file.vault-private-link.content).A
  zone_name           = yamldecode(data.local_file.vault-private-link.content).name
  vnet_links          = yamldecode(data.local_file.vault-private-link.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env

  zone_contributors = [
    data.azuread_service_principal.dts_sps_sbox.object_id,
  ]
}
