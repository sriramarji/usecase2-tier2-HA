variable "vpc_id" {
  type = string
  description = "ID of VPC"
}

variable "private_subnet_ids" {
  type = list(string)
  description = "IDs of private subnets"
}

variable "db_instance_type" {
  type = string
  description = "Instance type for the RDS instance"
}

variable "db_username" {
  type = string
  description = "Username for the database"
}

variable "db_password" {
  type = string
  sensitive = true
  description = "Password for the database"
}

variable "web_sg_id" {
  type = list(string)
  description = "ID of the web server security group"
}