resource "aws_dynamodb_table" "locktable" {
  name           = "gw_prod_terraform_state"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name        = "gw_prod_terraform_state"
    Environment = "Prod"
  }
}
