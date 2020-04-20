data "local_file" "demo-internal-configuration" {
  filename = "${path.cwd}/../../environments/demo/service-core-compute-demo-internal.yml"
}

data "local_file" "demo-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/demo/service-core-compute-idam-demo-internal.yml"
}

data "local_file" "demo-platform-configuration" {
  filename = "${path.cwd}/../../environments/demo/demo-platform-hmcts-net.yml"
}

data "local_file" "demo-reform-configuration" {
  filename = "${path.cwd}/../../environments/demo/demo-reform-hmcts-net.yml"
}
