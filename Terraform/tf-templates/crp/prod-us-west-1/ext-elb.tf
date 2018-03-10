data "aws_elb_service_account" "main" {}

module "ext-elb" {
  source                        = "../../../tf-modules/module-elb"
  vpc_id                        = "${data.terraform_remote_state.vpc.vpc_id}"
  elb_subnets                   = "${data.terraform_remote_state.vpc.vpc_public_subnet_ids}"
  elb_instances                 = ["${module.was.ec2_instance_ids}"]
  is_public                     = "true"
  elb_access_logs_bucket_name   = "${var.crp_elb_logs_bucket_name}"
  elb_access_logs_bucket_prefix = "crp-elb"
  elb_access_logs_interval      = "5"
  app_port                      = "${var.crp_app_port}"
  elb_ssl_cert_iam_id           = "${var.crp_elb_cert_iam_id}"
  elb_health_check              = "${var.crp_elb_health_check}"
  elb_health_check_protocol     = "${var.crp_elb_health_check_protocol}"
  elb_healthy_threshold         = "${var.crp_elb_healthy_threshold}"
  elb_unhealthy_threshold       = "${var.crp_elb_unhealthy_threshold}"
  elb_health_check_timeout      = "${var.crp_elb_health_check_timeout}"
  tag_project                   = "${var.project}"
  tag_environment               = "${var.environment}"
  tag_service                   = "crp"
  tag_role                      = "web"
  tag_primary_owner             = "${var.primary_owner}"
  tag_secondary_owner           = "${var.secondary_owner}"
}

output "aws_elb_service_account_output" {
  value = "${data.aws_elb_service_account.main.arn}"
}
