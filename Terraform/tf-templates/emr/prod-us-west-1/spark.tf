resource "aws_emr_cluster" "spark" {
  name                              = "gw-spark"
  release_label                     = "emr-4.4.0"
  service_role                      = "EMR_DefaultRole"
  applications                      = ["Hadoop", "Ganglia", "Spark", "Hue"]
  log_uri                           = "${var.spark_log_uri}"
  master_instance_type              = "${var.master_instance_type}"
  core_instance_type                = "${var.core_instance_type}"
  core_instance_count               = "${var.core_instance_count}"
  termination_protection            = "false"
  keep_job_flow_alive_when_no_steps = "true"

  ec2_attributes {
    key_name                          = "${format("%s-emr-%s", data.terraform_remote_state.vpc.vpc_project, data.terraform_remote_state.vpc.vpc_environment)}"
    subnet_id                         = "${data.terraform_remote_state.vpc.emr_subnet_id}"
    additional_master_security_groups = "${data.terraform_remote_state.vpc.vpc_common_sg_id}"
    additional_slave_security_groups  = "${data.terraform_remote_state.vpc.vpc_common_sg_id}"
    emr_managed_master_security_group = "${data.terraform_remote_state.vpc.emr_private_master_sg_id}"
    emr_managed_slave_security_group  = "${data.terraform_remote_state.vpc.emr_private_slave_sg_id}"
    service_access_security_group     = "${data.terraform_remote_state.vpc.emr_service_access_sg_id}"
    instance_profile                  = "EMR_EC2_DefaultRole"
  }

  configurations = "../../../conf/spark-conf.json"

  tags {
    "Name"         = "gw-spark"
    "environment"  = "${data.terraform_remote_state.vpc.vpc_environment}"
    "first_owner"  = "${var.primary_owner}"
    "second_owner" = "${var.secondary_owner}"
    "provisioned"  = "terraform"
    "project"      = "${data.terraform_remote_state.vpc.vpc_project}"
  }

  lifecycle {
    ignore_changes = [
      "volume_tags",
      "tags",
      "log_uri",
    ]
  }
}
