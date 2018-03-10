resource "aws_s3_bucket" "gw-elk-backup" {
  bucket = "gw-elk-backup-prod"
  acl    = "private"

  tags {
    Name        = "gw-elk-backup-prod"
    Environment = "prod"
  }
}
