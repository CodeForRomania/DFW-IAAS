provider "aws" {
  region  = "${data.terraform_remote_state.vpc.vpc_region}"
  profile = "satish"
}
