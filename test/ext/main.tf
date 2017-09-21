variable "memory" {}

data "external" "ips" {
  program = ["cat", "${path.module}/test.json"]
}

output "module_path" {
  value = "${path.module}"
}

output "out-value" {
  value = "${data.external.ips.result["hello"]}"
}
