module "redis" {
  source            = "../../../tf-modules/module-redis"
  cluster_name      = "crp-cache"
  vpc_cidr_block    = "${data.terraform_remote_state.vpc.vpc_cidr_block}"
  vpc_id            = "${data.terraform_remote_state.vpc.vpc_id}"
  azs               = ["${element(data.terraform_remote_state.vpc.vpc_azs, 0)}"]
  subnets           = "${data.terraform_remote_state.vpc.vpc_private_subnet_ids}"
  subscriber_sg     = "${aws_security_group.was.id}"
  env_prefix        = "US"
  env               = "prod"
  service           = "crp"
  tag_second_owner  = "noboby"
  tag_primary_owner = "kl.cheng@partner.samsung.com"
  tag_project       = "kpgw"
  tag_env           = "prod"
}
