data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket         = "terraform-prod-us-west-1"
    key            = "terraform/state/prod/us-west-1/vpc/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "gw_prod_terraform_state"
    profile        = "${var.aws_profile}"
  }
}

data "terraform_remote_state" "crp" {
  backend = "s3"

  config {
    bucket         = "terraform-prod-us-west-1"
    key            = "terraform/state/prod/us-west-1/crp/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "gw_prod_terraform_state"
    profile        = "${var.aws_profile}"
  }
}

data "terraform_remote_state" "kms" {
  backend = "s3"

  config {
    bucket         = "terraform-prod-us-west-1"
    key            = "terraform/state/prod/us-west-1/kms/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "gw_prod_terraform_state"
    profile        = "${var.aws_profile}"
  }
}
