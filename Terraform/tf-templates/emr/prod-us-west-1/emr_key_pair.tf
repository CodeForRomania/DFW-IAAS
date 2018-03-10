resource "aws_key_pair" "mod" {
  key_name   = "${format("%s-emr-%s-local", data.terraform_remote_state.vpc.vpc_project, data.terraform_remote_state.vpc.vpc_environment)}"
  public_key = "${file("../../../ssh-keys/kpgw-emr-prod-local.pub")}"
}
