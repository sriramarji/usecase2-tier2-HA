output "vpc_id" {
  value = module.vpc.vpc_id
  description = "ID of the VPC"
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
  description = "IDs of the public subnets"
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
  description = "IDs of the private subnets"
}

output "web_server_public_ips" {
  value = module.ec2.web_server_public_ips
  description = "Public IPs of the web servers"
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
  description = "Endpoint of the RDS instance"
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}
