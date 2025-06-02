output "vpc_id" {
    value = aws_vpc.usecase-2.id
    description = "to get vpc ID"
}

output "public_subnet_ids" {
    value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
    description = "to get public subnets IDs"
}

output "private_subnet_ids" {
    value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
    description = "to get private subnets IDs"
}