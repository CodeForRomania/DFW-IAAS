# VPC common security groups
resource "aws_security_group" "common" {
  name   = "${lower(format("%s-%s-common-sg", var.project, var.environment))}"
  vpc_id = "${module.vpc.vpc_id}"

  tags {
    "Name"        = "${upper(format("%s-%s-common-sg", var.project, var.environment))}"
    "role"        = "common"
    "provisioned" = "terraform"
  }
}

# All ssh access by explicit IPs
resource "aws_security_group_rule" "ingress-common-ssh" {
  type        = "ingress"
  from_port   = "${var.ssh_port}"
  to_port     = "${var.ssh_port}"
  protocol    = "tcp"
  cidr_blocks = ["${var.vpc_cidr}"]

  security_group_id = "${aws_security_group.common.id}"
}
