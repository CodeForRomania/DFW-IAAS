resource "aws_ebs_volume" "gw-elk-stg1" {
  availability_zone = "${data.terraform_remote_state.vpc.vpc_region}a"
  type              = "gp2"
  size              = 400

  tags {
    Name = "gw-elk-${var.environment}"
  }
}

resource "aws_volume_attachment" "ebs_elk_att" {
  device_name = "/dev/sdc"
  volume_id   = "${aws_ebs_volume.gw-elk-stg1.id}"
  instance_id = "${element("${module.elk.ec2_instance_ids}", 0)}"
}
