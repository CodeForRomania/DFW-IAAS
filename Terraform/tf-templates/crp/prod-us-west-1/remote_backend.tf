terraform {
  backend "s3" {
    bucket     = "terraform-prod-us-west-1"
    key        = "terraform/state/prod/us-west-1/crp/terraform.tfstate"
    region     = "us-west-1"
    lock_table = "gw_prod_terraform_state"
    profile    = "satish"
  }
}
