variable "aws_region" {
    type = string
    description = "aws region"
}

variable "vpc_cidr" {
    type = string
    description = "vpc CIDR block"
}

variable "public_subnet_1_cidr" {
    type = string
    description = "first public subnet CIDR block"
}

variable "public_subnet_2_cidr" {
    type = string
    description = "second public subnet CIDR block"
}

variable "private_subnet_1_cidr" {
    type = string
    description = "first private subnet CIDR block"
}

variable "private_subnet_2_cidr" {
    type = string
    description = "second private subnet CIDR block"
}