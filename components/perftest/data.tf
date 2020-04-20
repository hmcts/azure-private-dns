data "local_file" "perftest-internal-configuration" {
  filename = "${path.cwd}/../../environments/perftest/service-core-compute-perftest-internal.yml"
}

data "local_file" "perftest-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/perftest/service-core-compute-idam-perftest-internal.yml"
}

data "local_file" "perftest-platform-configuration" {
  filename = "${path.cwd}/../../environments/perftest/perftest-platform-hmcts-net.yml"
}

data "local_file" "perftest-reform-configuration" {
  filename = "${path.cwd}/../../environments/perftest/perftest-reform-hmcts-net.yml"
}
