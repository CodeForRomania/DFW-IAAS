# List of resources exported:
output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "vpc_region" {
  value = "${var.region}"
}

output "vpc_environment" {
  value = "${var.environment}"
}

output "vpc_project" {
  value = "${var.project}"
}

output "vpc_azs" {
  value = "${module.vpc.vpc_azs}"
}

output "vpc_zone_aliases" {
  value = "${module.vpc.zone_aliases}"
}

output "vpc_key_name" {
  value = "${module.vpc.ec2_key_name}"
}

output "vpc_cidr_block" {
  value = "${module.vpc.vpc_cidr_block}"
}

output "vpc_private_subnet_ids" {
  value = "${module.vpc.private_subnets_ids}"
}

output "vpc_public_subnet_ids" {
  value = "${module.vpc.public_subnets_ids}"
}

output "vpc_igw_id" {
  value = "${module.vpc.igw_id}"
}

output "vpc_nat_eips" {
  value = "${module.vpc.nat_eips}"
}

output "vpc_nat_eips_public_ips" {
  value = "${module.vpc.nat_eips_public_ips}"
}

output "vpc_natgw_ids" {
  value = "${module.vpc.nat_gw_ids}"
}

output "vpc_bastion_sg_id" {
  value = "${module.vpc.bastion_security_group_id}"
}

output "internal_zone_id" {
  value = "${module.vpc.r53_internal_zone_id}"
}

output "internal_zone_ns" {
  value = "${module.vpc.r53_internal_zone_ns}"
}

output "internal_zone_domain" {
  value = "${module.vpc.r53_internal_zone_domain}"
}

output "vpc_bastion_public_ips" {
  value = "${module.bastion.ec2_instance_public_ips}"
}

output "vpc_bastion_public_dns" {
  value = "${module.bastion.ec2_instance_public_dns}"
}

output "emr_subnet_id" {
  value = "${module.emr-setup.emr_subnet_id}"
}

output "emr_public_master_sg_id" {
  value = "${module.emr-setup.emr_public_master_sg_id}"
}

output "emr_public_master_sg_name" {
  value = "${module.emr-setup.emr_public_master_sg_name}"
}

output "emr_private_master_sg_id" {
  value = "${module.emr-setup.emr_private_master_sg_id}"
}

output "emr_private_master_sg_name" {
  value = "${module.emr-setup.emr_private_master_sg_name}"
}

output "emr_public_slave_sg_id" {
  value = "${module.emr-setup.emr_public_slave_sg_id}"
}

output "emr_public_slave_sg_name" {
  value = "${module.emr-setup.emr_public_slave_sg_name}"
}

output "emr_private_slave_sg_id" {
  value = "${module.emr-setup.emr_private_slave_sg_id}"
}

output "emr_private_slave_sg_name" {
  value = "${module.emr-setup.emr_private_slave_sg_name}"
}

output "emr_service_access_sg_id" {
  value = "${module.emr-setup.emr_service_access_sg_id}"
}

output "emr_service_access_sg_name" {
  value = "${module.emr-setup.emr_service_access_sg_name}"
}

output "vpc_common_sg_id" {
  value = "${aws_security_group.common.id}"
}

output "vpc_common_sg_name" {
  value = "${aws_security_group.common.name}"
}
