resource "aws_elb" "zeppelin-elb-stg1" {
  name                        = "ext-web-zeppelin-elb"
  subnets                     = ["${data.terraform_remote_state.vpc.vpc_public_subnet_ids}"]
  security_groups             = ["${aws_security_group.zeppelin-elb.id}"]
  instances                   = ["${aws_instance.zeppelin_master.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 60
  connection_draining         = false
  connection_draining_timeout = 300

  internal = false

  access_logs {
    bucket        = "${var.zeppelin_elb_logs_bucket_name}"
    bucket_prefix = "zeppelin-elb"
    interval      = "5"
  }

  listener {
    instance_port      = "9995"
    instance_protocol  = "tcp"
    lb_port            = "443"
    lb_protocol        = "ssl"
    ssl_certificate_id = "${var.crp_elb_cert_iam_id}"
  }

  listener {
    instance_port     = "9995"
    instance_protocol = "tcp"
    lb_port           = "80"
    lb_protocol       = "tcp"
  }

  listener {
    instance_port     = "8080"
    instance_protocol = "tcp"
    lb_port           = "8080"
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = "${var.crp_elb_healthy_threshold}"
    unhealthy_threshold = "${var.crp_elb_unhealthy_threshold}"
    interval            = 10
    target              = "${format("%s:%s%s", var.crp_elb_health_check_protocol, var.crp_zeppelin_port, var.crp_zeppelin_elb_health_check)}"
    timeout             = "${var.crp_elb_health_check_timeout}"
  }

  tags {
    "Name" = "ext-web-zeppelin-elb"
  }
}
