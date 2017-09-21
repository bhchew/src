provider "vault" {
  address = ""
  token = ""
}

data "vault_generic_secret" "aws_sec" {
  path = "secret/aws"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${data.vault_generic_secret.aws_sec.data["api-sec"]}"
  region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  ami = ""
  instance_type = "t2.micro"
  associate_public_ip_address = false
  availability_zone = "ap-southeast-1a"
  key_name = ""
  security_groups = [""]
  subnet_id = ""

  ebs_block_device {
    delete_on_termination = true
    device_name = "/dev/sda1"
    volume_type = "gp2"
  }

  tags {
    Name = "HelloWorld"
  }
}
