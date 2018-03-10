module "bastion" {
  source            = "../../../tf-modules/module-ec2"
  nodes_qty         = "${var.bastion_qty}"
  ami               = "${var.bastion_ami}"
  instance_type     = "${var.bastion_instance_type}"
  aws_key_pair_name = "${module.vpc.ec2_key_name}"
  subnet_ids        = "${module.vpc.public_subnets_ids}"
  has_public_ip     = "1"
  ec2_sg_list       = ["${module.vpc.bastion_security_group_id}"]
  ec2_user_data     = "${file("../../../cloud-init/bastion-cloud-init")}"
  tag_project       = "${var.project}"
  tag_environment   = "${var.environment}"
  tag_service       = "${var.project}"
  tag_role          = "ssh"
  tag_zones         = "${module.vpc.zone_aliases}"
}
