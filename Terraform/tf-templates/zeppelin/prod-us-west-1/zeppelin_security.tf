resource "aws_security_group" "zeppelin" {
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"
  name        = "${format("%s-%s-%s-sg", "zeppelin",var.service, var.environment)}"
  description = "${format("%s-%s-%s-sg", "zeppelin", var.service, var.environment)}"

  tags {
    "Name"         = "${format("%s-%s-%s-sg", "zeppelin", var.service, var.environment)}"
    "environment"  = "${var.environment}"
    "first_owner"  = "${var.primary_owner}"
    "second_owner" = "${var.secondary_owner}"
    "time_frame"   = "${var.timeframe}"
    "provisioned"  = "terraform"
    "project"      = "${var.project}"
  }
}

resource "aws_security_group_rule" "zeppelin_egress_all" {
  security_group_id = "${aws_security_group.zeppelin.id}"
  type              = "egress"
  from_port         = "0"
  to_port           = "0"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "zeppelin-8080" {
  security_group_id        = "${aws_security_group.zeppelin.id}"
  type                     = "ingress"
  from_port                = "8080"
  to_port                  = "8080"
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.zeppelin-elb.id}"
}

resource "aws_security_group_rule" "zeppelin-5601" {
  security_group_id        = "${aws_security_group.zeppelin.id}"
  type                     = "ingress"
  from_port                = "80"
  to_port                  = "9999"
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.zeppelin-elb.id}"
}

resource "aws_security_group_rule" "zeppelin-5044" {
  security_group_id = "${aws_security_group.zeppelin.id}"
  type              = "ingress"
  from_port         = "5044"
  to_port           = "5044"
  protocol          = "tcp"
  cidr_blocks       = ["10.190.0.0/16"]
}

resource "aws_security_group_rule" "zeppelin-internal" {
  security_group_id = "${aws_security_group.zeppelin.id}"
  type              = "ingress"
  from_port         = "0"
  to_port           = "65535"
  protocol          = "tcp"
  cidr_blocks       = ["10.190.1.0/24"]
}

output "crp_zeppelin_sg_id" {
  value = "${aws_security_group.zeppelin.id}"
}

output "crp_zeppelin_sg_name" {
  value = "${aws_security_group.zeppelin.name}"
}
