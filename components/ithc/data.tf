data "local_file" "ithc-internal-configuration" {
  filename = "${path.cwd}/../../environments/ithc/service-core-compute-ithc-internal.yml"
}

data "local_file" "ithc-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/ithc/service-core-compute-idam-ithc-internal.yml"
}

data "local_file" "ithc-platform-configuration" {
  filename = "${path.cwd}/../../environments/ithc/ithc-platform-hmcts-net.yml"
}

data "local_file" "ithc-reform-configuration" {
  filename = "${path.cwd}/../../environments/ithc/ithc-reform-hmcts-net.yml"
}
