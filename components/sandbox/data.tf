data "local_file" "sandbox-platform-configuration" {
  filename = "${path.cwd}/../../environments/sandbox/sandbox-platform-hmcts-net.yml"
}

data "local_file" "sandbox-internal-configuration" {
  filename = "${path.cwd}/../../environments/sandbox/service-core-compute-sandbox-internal.yml"
}

data "local_file" "sandbox-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/sandbox/service-core-compute-idam-sandbox-internal.yml"
}
