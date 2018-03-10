resource "aws_security_group" "was" {
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"
  name        = "${format("%s-%s-%s-sg", "was",var.service, var.environment)}"
  description = "${format("%s-%s-%s-sg", "was", var.service, var.environment)}"

  tags {
    "Name"         = "${format("%s-%s-%s-sg", "was", var.service, var.environment)}"
    "environment"  = "${var.environment}"
    "first_owner"  = "${var.primary_owner}"
    "second_owner" = "${var.secondary_owner}"
    "time_frame"   = "${var.timeframe}"
    "provisioned"  = "terraform"
    "project"      = "${var.project}"
  }
}

resource "aws_security_group_rule" "was_egress_all" {
  security_group_id = "${aws_security_group.was.id}"
  type              = "egress"
  from_port         = "0"
  to_port           = "0"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "was-8080" {
  security_group_id        = "${aws_security_group.was.id}"
  type                     = "ingress"
  from_port                = "8080"
  to_port                  = "8080"
  protocol                 = "tcp"
  source_security_group_id = "${module.ext-elb.elb_sg_id}"
}

output "crp_was_sg_id" {
  value = "${aws_security_group.was.id}"
}

output "crp_was_sg_name" {
  value = "${aws_security_group.was.name}"
}
