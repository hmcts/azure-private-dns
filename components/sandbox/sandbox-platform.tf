data "local_file" "sandbox-platform-configuration" {
  filename = "${path.cwd}/../../environments/sandbox/sandbox-platform-hmcts-net.yml"
}

data "azuread_service_principal" "sandbox_platform_contributors" {
  for_each     = toset(try(yamldecode(data.local_file.sandbox-platform-configuration.content).contributors, []))
  display_name = each.value
}

module "sandbox-platform" {
  source              = "../../modules/azure-private-dns/"
  cname_records       = yamldecode(data.local_file.sandbox-platform-configuration.content).cname
  a_recordsets        = yamldecode(data.local_file.sandbox-platform-configuration.content).A
  zone_name           = yamldecode(data.local_file.sandbox-platform-configuration.content).name
  vnet_links          = yamldecode(data.local_file.sandbox-platform-configuration.content).vnet_links
  resource_group_name = var.resource_group_name
  env                 = var.env
  builtFrom           = var.builtFrom
  product             = var.product

  zone_contributors = values(data.azuread_service_principal.sandbox_platform_contributors)[*].object_id
}
