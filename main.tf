module "vpc" {
  source = "./modules/vpc"

  aws_region    = var.aws_region
  vpc_cidr      = var.vpc_cidr
  public_subnet_1_cidr   = var.public_subnet_1_cidr
  public_subnet_2_cidr   = var.public_subnet_2_cidr
  private_subnet_1_cidr  = var.private_subnet_1_cidr
  private_subnet_2_cidr  = var.private_subnet_2_cidr
}

module "ec2" {
  source = "./modules/ec2"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  vpc_id            = module.vpc.vpc_id
  public_subnet_id_1  = module.vpc.public_subnet_ids[0]
  public_subnet_id_2  = module.vpc.public_subnet_ids[1]
}

module "rds" {
  source = "./modules/rds"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  db_instance_type   = var.db_instance_type
  db_username        = var.db_username
  db_password        = var.db_password
  web_sg_id          = module.ec2.web_sg_id
}

module "alb" {
  source                = "./modules/alb"
  name                  = "web-lb"
  #security_group_id     = module.security_groups.web_sg_id
  #subnet_ids            = module.network.public_subnets_id
  target_group_name     = "web-target-group"
  target_group_port     = 80
  target_group_protocol = "HTTP"
  vpc_id                = module.vpc.vpc_id
  health_check_path     = "/"
  health_check_protocol = "HTTP"
  health_check_interval = 30
  health_check_timeout  = 5
  healthy_threshold     = 2
  unhealthy_threshold   = 2
  listener_port         = 80
  listener_protocol     = "HTTP"
  target_ids            = module.ec2.instance_id
  tags                  = var.tags
}