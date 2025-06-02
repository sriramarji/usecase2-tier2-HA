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
  key_name          = var.key_name
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