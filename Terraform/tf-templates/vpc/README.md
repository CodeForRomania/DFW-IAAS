# KPGetWell Project

This is a terraform representation of vpc for KP GetWell; configuring items:
- VPC
- Subnets
- Route tables
- NAT Gateways
- Security Groups
- EMR Security Groups

## Dependencies

This stack is dependent on the following Terraform modules:  

- module-vpc -  https://git.sec.samsung.net/gw-health-terraform/module-vpc
- module-ec2 - https://git.sec.samsung.net/gw-health-terraform/module-ec2
- module-emr-setup - https://git.sec.samsung.net/gw-health-terraform/module-emr-setup


### Tooling
This module is only tested on Terraform 0.9.x.  Terraform 0.10 or higher is not supported.  
In fact, it probably will break this module.

- Terraform 0.9.x

### AWS access

You should already have access to AWS account
- `b2b-sanjose` - KP GetWell STG and STG@
- `production` - GetWell Production AWS IAM credentials (prd)


### Remote State Configuration

To include the remote state of this stack, the recommended configuration are
```
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket  = "${var.s3_remote_bucket_name}"
    key     = "states/${var.env}-${var.region}/vpc.tfstate"
    region  = "${var.s3_remote_bucket_region}"
    profile = "${var.aws_profile}"
  }
}
```
