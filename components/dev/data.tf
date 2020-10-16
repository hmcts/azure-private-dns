data "local_file" "preview-internal-configuration" {
  filename = "${path.cwd}/../../environments/dev/service-core-compute-preview-internal.yml"
}

data "local_file" "preview-idam-internal-configuration" {
  filename = "${path.cwd}/../../environments/dev/service-core-compute-idam-preview-internal.yml"
}

data "local_file" "preview-platform-configuration" {
  filename = "${path.cwd}/../../environments/dev/preview-platform-hmcts-net.yml"
}
