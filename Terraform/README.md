# Setup Prod Environment Using Terraform

## Initial Configurations
-   Create Admin user with API access credentials
-   Create profile in ~/.aws/credentials - satish

## Deployment Procedures
1.  Create a S3 bucket for terraform state - terraform-prod-us-west-1
    `terraform/state/prod/us-west-1/SERVICE/terraform.tfstate`
2.  Create a S3 bucket for logs - kpgw-prod
3.  Add policies/s3.json to logs S3 bucket policy
4.  Request SSL from AWS - kpgw-prod.samsunghealth.com
5.  Create a 2 key pairs and import to terraform - kpgw-prod and kpgw-emr-prod
6.  Generate ssh-keys locally and add public keys to ssh-keys
7.  Run Terraform project: dynamodb
8.  Run Terraform project: vpc
9.  Run Terraform project: crp
10. Run `aws emr create-default-roles --profile satish`
11. Run Terraform project: kms
12. Run Terraform project: emr
13. Run Terraform project: elk
14. Run Terraform project: zeppelin
