variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_vpn_ami" {}

variable "cloudflare_email" {}
variable "cloudflare_token" {}
variable "cloudflare_domain" {}
variable "cloudflare_subdomain" {}
variable "cloudflare_record_type" {}

variable "aws_region" {
  default = "ap-southeast-1"
}
