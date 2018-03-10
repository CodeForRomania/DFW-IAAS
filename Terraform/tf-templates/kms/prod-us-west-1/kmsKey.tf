resource "aws_kms_key" "db_hdp_stg" {
  description = "KMS key for database encryption for prod"

  policy = <<EOF
    {
        "Version": "2012-10-17",
        "Id": "key-default-1",
        "Statement": [
          {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
              "AWS": [
                "arn:aws:iam::060671536724:root",
                "arn:aws:iam::060671536724:role/EMR_EC2_DefaultRole"
              ]
            },
            "Action": "kms:*",
            "Resource": "*"
          }
        ]
      }
EOF

  tags {
    "Name" = "db_hdp_prod"
  }
}

resource "aws_kms_alias" "db_hdp_stg_alias" {
  name          = "alias/getwell/db_hdp_prod"
  target_key_id = "${aws_kms_key.db_hdp_stg.key_id}"
}

output "db_hdp_stg.arn" {
  value = "${aws_kms_key.db_hdp_stg.arn}"
}
