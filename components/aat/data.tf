data "local_file" "aat-internal-configuration" {
  filename = "${path.cwd}/../../environments/aat/service-core-compute-aat-internal.yml"
}

data "local_file" "aat-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/aat/service-core-compute-idam-aat-internal.yml"
}

data "local_file" "aat2-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/aat/service-core-compute-idam-aat2-internal.yml"
}

data "local_file" "aat-platform-configuration" {
  filename = "${path.cwd}/../../environments/aat/aat-platform-hmcts-net.yml"
}

data "local_file" "aat-reform-configuration" {
  filename = "${path.cwd}/../../environments/aat/aat-reform-hmcts-net.yml"
}
