resource "aws_instance" "zeppelin_master" {
  ami             = "${var.zeppelin_ami}"
  instance_type   = "${var.zeppelin_instance_type}"
  key_name        = "${var.zeppelin_key_pair}"
  subnet_id       = "${element(data.terraform_remote_state.vpc.vpc_private_subnet_ids, 0)}"
  security_groups = ["${aws_security_group.zeppelin.id}", "${data.terraform_remote_state.vpc.vpc_common_sg_id}", "${data.terraform_remote_state.vpc.emr_private_master_sg_id}"]
  user_data       = "${file("../../../cloud-init/zeppelin-cloud-init")}"

  root_block_device = {
    volume_type = "gp2"
    volume_size = 32
  }

  tags {
    "Name"    = "${join("-", list("zeppelin-master", var.service, var.availability_zone, var.environment))}"
    "project" = "${var.project}"
  }
}

resource "aws_ebs_volume" "gw-zeppelin-master-stg" {
  availability_zone = "${data.terraform_remote_state.vpc.vpc_region}a"
  type              = "gp2"
  size              = 80
  encrypted         = true
  kms_key_id        = "${data.terraform_remote_state.kms.db_hdp_stg.arn}"

  tags {
    Name = "gw-zeppelin-master-${var.environment}"
  }
}

resource "aws_volume_attachment" "ebs_zeppelin_master_att" {
  device_name = "/dev/sdb"
  volume_id   = "${aws_ebs_volume.gw-zeppelin-master-stg.id}"
  instance_id = "${aws_instance.zeppelin_master.id}"
}
