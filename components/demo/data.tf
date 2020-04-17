data "local_file" "demo-internal-configuration" {
  filename = "${path.cwd}/../../environments/demo/service-core-compute-demo-internal.yml"
}

data "local_file" "demo-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/demo/service-core-compute-idam-demo-internal.yml"
}

