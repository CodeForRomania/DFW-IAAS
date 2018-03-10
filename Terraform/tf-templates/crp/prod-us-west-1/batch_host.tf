module "batch_host" {
  source            = "../../../tf-modules/module-ec2"
  nodes_qty         = "1"
  ami               = "${var.was_ami}"
  instance_type     = "${var.was_instance_type}"
  aws_key_pair_name = "${data.terraform_remote_state.vpc.vpc_key_name}"
  subnet_ids        = "${data.terraform_remote_state.vpc.vpc_private_subnet_ids}"
  ec2_sg_list       = ["${aws_security_group.was.id}", "${data.terraform_remote_state.vpc.vpc_common_sg_id}"]
  ec2_user_data     = "${file("../../../cloud-init/was-cloud-init")}"
  tag_project       = "${var.project}"
  tag_environment   = "${var.environment}"
  tag_service       = "crp"
  tag_role          = "bat"
  tag_zones         = "${data.terraform_remote_state.vpc.vpc_zone_aliases}"
}
