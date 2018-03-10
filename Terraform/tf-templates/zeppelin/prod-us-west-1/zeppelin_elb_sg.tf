resource "aws_security_group" "zeppelin-elb" {
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"
  name        = "${format("%s-%s-%s-sg", "ext", "web", "zeppelin")}"
  description = "${format("%s-%s-%s-sg", "ext", "web", "zeppelin")}"

  tags {
    "Name" = "${format("%s-%s-%s-sg", "ext", "web", "zeppelin")}"
  }
}

resource "aws_security_group_rule" "elb_egress_all" {
  security_group_id = "${aws_security_group.zeppelin-elb.id}"
  type              = "egress"
  from_port         = "0"
  to_port           = "0"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "elb_tcp" {
  security_group_id = "${aws_security_group.zeppelin-elb.id}"
  type              = "ingress"
  from_port         = "80"
  to_port           = "9999"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
