variable "ami_id" {
  type = string
  description = "AMI ID for the EC2 instances"
}

variable "instance_type" {
  type = string
  description = "Instance type for the EC2 instances"
}

variable "vpc_id" {
  type = string
  description = "ID of the VPC"
}

variable "public_subnet_id_1" {
  type = string
  description = "ID of the first public subnet"
}

variable "public_subnet_id_2" {
  type = string
  description = "ID of the second public subnet"
}