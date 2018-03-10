resource "aws_security_group_rule" "phoenix" {
  type      = "ingress"
  to_port   = "8765"
  from_port = "8765"
  protocol  = "tcp"

  security_group_id        = "${data.terraform_remote_state.vpc.emr_private_master_sg_id}"
  source_security_group_id = "${data.terraform_remote_state.crp.crp_was_sg_id}"
}
