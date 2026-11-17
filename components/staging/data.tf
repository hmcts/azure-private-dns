data "local_file" "staging-platform-cross-tenant-nonlive" {
  filename = "${path.cwd}/../../environments/staging/staging-platform-hmcts-net-cross-tenant-nonlive.yml"
}

data "azuread_service_principal" "staging_platform_contributors" {
  for_each     = toset(try(yamldecode(data.local_file.staging-platform-configuration.content).contributors, []))
  display_name = each.value
}
