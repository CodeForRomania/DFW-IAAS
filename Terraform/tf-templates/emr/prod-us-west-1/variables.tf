variable "aws_profile" {
  default = "satish"
}

variable "hbase_log_uri" {
  description = "Log folder in URI format"
  default     = "s3://kpgw-prod/hbase/logs"
}

variable "spark_log_uri" {
  description = "Log folder in URI format"
  default     = "s3://kpgw-prod/spark/logs"
}

variable "zeppelin_log_uri" {
  description = "Log folder in URI format"
  default     = "s3://kpgw-prod/zeppelin/logs"
}

variable "master_instance_type" {
  default = "m4.large"
}

variable "core_instance_type" {
  default = "m4.large"
}

variable "core_instance_count" {
  default = "3"
}

variable "emr_key_pair_name" {
  default = "kpgw-emr-prod-local"
}

variable "primary_owner" {
  default = "mingbo.sha"
}

variable "secondary_owner" {
  default = "none"
}
