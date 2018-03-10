terraform {
  backend "s3" {
    bucket  = "terraform-prod-us-west-1"
    key     = "terraform/state/prod/us-west-1/dynamodb/terraform.tfstate"
    region  = "us-west-1"
    profile = "satish"
  }
}
