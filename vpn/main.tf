provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "vpn" {
  ami           = "${var.aws_vpn_ami}"
  instance_type = "t2.micro"
  availability_zone = "ap-southeast-1a"
  key_name = ""
  security_groups = [""]
  subnet_id = ""
  associate_public_ip_address = true

  ebs_block_device {
    delete_on_termination = true
    device_name = "/dev/sda1"
    volume_type = "gp2"
  }

  tags {
    Name = "myVPN"
  }
}

# Configure the Cloudflare provider
provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

# Add a record to the domain
resource "cloudflare_record" "dns" {
  domain = "${var.cloudflare_domain}"
  name   = "${var.cloudflare_subdomain}"
  value  = "${aws_instance.vpn.public_dns}"
  type   = "${var.cloudflare_record_type}"
  ttl    = "120"
}


output "dns" {
    value = "${aws_instance.vpn.public_dns}"
}
