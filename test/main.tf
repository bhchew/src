variable "memory" {}

terraform {
  backend "consul" {
    address = ""
    path    = ""
    access_token = ""
    #lock    = false
  }
}

provider "vault" {
  address = ""
  token = ""
}

data "vault_generic_secret" "rundeck_auth" {
  path = "secret/hello"
}

module "child" {
  source = "./child"
  memory = "${var.memory}"
}

output "child_memory" {
  value = "${module.child.received}"
}

#output "vault_secret" {
#  value = "${vault_generic_secret.rundeck_auth.data["abc"]}"
#}
