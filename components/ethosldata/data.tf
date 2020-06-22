data "local_file" "ethosldata-internal-configuration" {
  filename = "${path.cwd}/../../environments/ethosldata/service-core-compute-ethosldata-internal.yml"
}

data "local_file" "ethosldata-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/ethosldata/service-core-compute-idam-ethosldata-internal.yml"
}

data "local_file" "ethosldata-platform-configuration" {
  filename = "${path.cwd}/../../environments/ethosldata/ethosldata-platform.hmcts-net.yml"
}
