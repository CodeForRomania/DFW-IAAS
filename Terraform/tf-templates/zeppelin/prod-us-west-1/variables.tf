variable "aws_profile" {
  default = "satish"
}

variable "s3_remote_bucket_name" {
  default = "kpgw-prod"
}

variable "project" {
  default = "kpgw"
}

variable "environment" {
  default = "prod"
}

variable "service" {
  default = "crp"
}

variable "primary_owner" {
  default = "mingbo.sha"
}

variable "secondary_owner" {
  default = "mingbo.sha"
}

variable "timeframe" {
  default = "7X24"
}

# ELB Session
variable "zeppelin_elb_logs_bucket_name" {
  description = "S3 bucket where access log is stored"
  default     = "kpgw-prod"
}

variable "crp_elb_logs_interval" {
  default = "10"
}

variable "crp_zeppelin_port" {
  description = "Ambari UI listening port"
  default     = "8080"
}

variable "crp_elb_cert_iam_id" {
  description = "SSL Certificate IAM ID"
  default     = "arn:aws:acm:us-west-1:060671536724:certificate/536fe838-e31b-4ab8-ab3a-0deaffef5c4c"
}

variable "crp_zeppelin_elb_health_check" {
  default = "/#/login"
}

variable "crp_elb_health_check_protocol" {
  default = "HTTP"
}

variable "crp_elb_healthy_threshold" {
  default = "3"
}

variable "crp_elb_unhealthy_threshold" {
  default = "2"
}

variable "crp_elb_health_check_timeout" {
  default = "5"
}

variable "availability_zone" {
  default = "uw1a"
}

# EC2 Session
variable "zeppelin_instance_type" {
  default = "r3.large"
}

variable "zeppelin_key_pair" {
  default = "kpgw-prod"
}

variable "zeppelin_master_count" {
  default = "1"
}

variable "zeppelin_data_count" {
  default = "2"
}

variable "zeppelin_ami" {
  default = "ami-e69ebc86"
}
