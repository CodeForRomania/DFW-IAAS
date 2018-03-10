module "emr-setup" {
  source          = "../../../tf-modules/module-emr-setup"
  vpc_id          = "${module.vpc.vpc_id}"
  cidr_block      = "${var.emr_cidr_block}"
  azone           = "${element(var.vpc_azs,0)}"
  nat_gateway_id  = "${element(module.vpc.nat_gw_ids, 0)}"
  tag_project     = "${var.project}"
  tag_environment = "${var.environment}"
  tag_service     = "${var.project}"
}
