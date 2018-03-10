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
variable "elk_elb_logs_bucket_name" {
  description = "S3 bucket where access log is stored"
  default     = "kpgw-prod"
}

variable "crp_elb_logs_interval" {
  default = "10"
}

variable "crp_elk_port" {
  description = "Kibana UI listening port"
  default     = "5601"
}

variable "crp_elb_cert_iam_id" {
  description = "SSL Certificate IAM ID"
  default     = "arn:aws:acm:us-west-1:060671536724:certificate/536fe838-e31b-4ab8-ab3a-0deaffef5c4c"
}

variable "crp_elk_elb_health_check" {
  default = "/app/kibana"
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

# EC2 Session
variable "elk_instance_type" {
  default = "t2.large"
}

variable "elk_ami" {
  default = "ami-563a1736"
}
