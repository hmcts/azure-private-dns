data "local_file" "prod-platform-configuration" {
  filename = "${path.cwd}/../../environments/prod/prod-platform-hmcts-net.yml"
}

data "local_file" "reform-configuration" {
  filename = "${path.cwd}/../../environments/prod/reform-hmcts-net.yml"
}

data "local_file" "prod-internal-configuration" {
  filename = "${path.cwd}/../../environments/prod/service-core-compute-prod-internal.yml"
}

data "local_file" "prod-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/prod/service-core-compute-idam-prod-internal.yml"
}

data "local_file" "prod2-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/prod/service-core-compute-idam-prod2-internal.yml"
}
