data "local_file" "aat-internal-configuration" {
  filename = "${path.cwd}/../../environments/aat/service-core-compute-aat-internal.yml"
}

data "local_file" "aat-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/aat/service-core-compute-idam-aat-internal.yml"
}

data "local_file" "aat2-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/aat/service-core-compute-idam-aat2-internal.yml"
}
