variable "ami_id" {
    type = string
    description = "ami-id for instance"
}

variable "instance_type" {
    type = string
    description = "instance-type for instance"
}

variable "key_name" {
    type = string
    description = "key_pair for instance"
}

variable "vpc_id"{
    type = string
    description = "ID of the VPC"
}

variable "public_subnet_id_1" {
    type = string
    description = "ID of first public subnet"
}

variable "public_subnet_id_2" {
    type = string
    description = "ID of second public subnet"
}