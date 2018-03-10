resource "aws_security_group" "elk" {
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"
  name        = "${format("%s-%s-%s-sg", "elk",var.service, var.environment)}"
  description = "${format("%s-%s-%s-sg", "elk", var.service, var.environment)}"

  tags {
    "Name"         = "${format("%s-%s-%s-sg", "elk", var.service, var.environment)}"
    "environment"  = "${var.environment}"
    "first_owner"  = "${var.primary_owner}"
    "second_owner" = "${var.secondary_owner}"
    "time_frame"   = "${var.timeframe}"
    "provisioned"  = "terraform"
    "project"      = "${var.project}"
  }
}

resource "aws_security_group_rule" "elk_egress_all" {
  security_group_id = "${aws_security_group.elk.id}"
  type              = "egress"
  from_port         = "0"
  to_port           = "0"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "elk-8080" {
  security_group_id        = "${aws_security_group.elk.id}"
  type                     = "ingress"
  from_port                = "8080"
  to_port                  = "8080"
  protocol                 = "tcp"
  source_security_group_id = "${module.elk-elb.elb_sg_id}"
}

resource "aws_security_group_rule" "elk-5601" {
  security_group_id        = "${aws_security_group.elk.id}"
  type                     = "ingress"
  from_port                = "5601"
  to_port                  = "5601"
  protocol                 = "tcp"
  source_security_group_id = "${module.elk-elb.elb_sg_id}"
}

resource "aws_security_group_rule" "elk-5044" {
  security_group_id = "${aws_security_group.elk.id}"
  type              = "ingress"
  from_port         = "5044"
  to_port           = "5044"
  protocol          = "tcp"
  cidr_blocks       = ["10.190.0.0/16"]
}

output "crp_elk_sg_id" {
  value = "${aws_security_group.elk.id}"
}

output "crp_elk_sg_name" {
  value = "${aws_security_group.elk.name}"
}
