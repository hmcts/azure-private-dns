data "local_file" "preview-internal-configuration" {
  filename = "${path.cwd}/../../environments/preview/service-core-compute-preview-internal.yml"
}

data "local_file" "preview-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/preview/service-core-compute-idam-preview-internal.yml"
}

data "local_file" "preview-platform-configuration" {
  filename = "${path.cwd}/../../environments/preview/preview-platform-hmcts-net.yml}"
}
