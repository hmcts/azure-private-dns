data "local_file" "perftest-internal-configuration" {
  filename = "${path.cwd}/../../environments/test/service-core-compute-perftest-internal.yml"
}

data "local_file" "perftest-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/test/service-core-compute-idam-perftest-internal.yml"
}

data "local_file" "perftest-platform-configuration" {
  filename = "${path.cwd}/../../environments/test/perftest-platform-hmcts-net.yml"
}
