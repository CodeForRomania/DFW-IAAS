module "vpc" {
  source               = "../../../tf-modules/module-vpc"
  tag_project          = "${var.name}"
  tag_environment      = "${var.environment}"
  internal_base_domain = "internal"
  vpc_cidr             = "${var.vpc_cidr}"
  private_subnets      = "${var.vpc_private_subnets}"
  public_subnets       = "${var.vpc_public_subnets}"
  haproxy_subnets      = "${var.vpc_haproxy_subnets}"
  ec2_key_pair         = "${file("../../../ssh-keys/kpgw-prod-local.pub")}"
  azs                  = "${var.vpc_azs}"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
  enable_nat_gateway   = "true"
  bastion_ingress_ips  = ["162.246.216.28/32"]
}
