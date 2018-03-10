variable "region" {
  default = "us-west-1"
}

variable "aws_profile" {
  default = "satish"
}

variable "environment" {
  default = "prod"
}

variable "name" {
  default = "kpgw"
}

variable "s3_remote_bucket_name" {
  default = "terraform-prod-us-west-1"
}

variable "primary_owner" {
  default = "mingbo.sha"
}

variable "seondary_owner" {
  default = "mingbo.sha"
}

variable "project" {
  default = "kpgw"
}

variable "vpc_cidr" {
  default = "10.190.0.0/16"
}

variable "vpc_private_subnets" {
  type    = "list"
  default = ["10.190.1.0/24", "10.190.2.0/24"]
}

variable "vpc_public_subnets" {
  type    = "list"
  default = ["10.190.101.0/24", "10.190.102.0/24"]
}

variable "vpc_haproxy_subnets" {
  type    = "list"
  default = ["10.190.111.0/24", "10.190.112.0/24"]
}

variable "vpc_azs" {
  type    = "list"
  default = ["us-west-1a", "us-west-1c"]
}

variable "haproxy_ports" {
  type    = "list"
  default = ["80", "443", "8080", "40022"]
}

variable "ssh-hub_ingress_ips" {
  type    = "list"
  default = []
}

variable "bastion_qty" {
  default = "1"
}

variable "bastion_ami" {
  default = "ami-7a85a01a"
}

variable "bastion_instance_type" {
  default = "t2.micro"
}

variable "emr_cidr_block" {
  default = "10.190.222.0/24"
}

variable "ssh_port" {
  default = "22"
}
