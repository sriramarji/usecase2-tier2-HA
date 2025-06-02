variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  type    = string
  default = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
    type = string
    default = "10.0.4.0/24"
}

variable "ami_id" {
  type    = string
  default = "ami-084568db4383264d4"
}

variable "instance_type" {
  type = string
  description = "Instance type"
  default = "t2.micro"
}

variable "db_instance_type" {
  type    = string
  default = "db.t3.micro"
  description = "RDS - instance type"
}

variable "db_username" {
  type    = string
  default = "admin"
  description = "database username"
}

variable "db_password" {
  type    = string
  sensitive = true
  default = "admin123"
  description = "database password"
}

