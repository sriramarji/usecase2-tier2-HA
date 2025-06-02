resource "aws_vpc" "usecase-2" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "usecase-2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.usecase-2.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.usecase-2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.usecase-2.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.usecase-2.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.usecase-2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "private-route-table"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.usecase-2.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = "us-east-1c"

  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.usecase-2.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = "us-east-1d"

  tags = {
    Name = "private-subnet-2"
  }
}

resource "aws_route_table_association" "public_subnet_1_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_2_assoc" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_subnet_1_assoc" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_subnet_2_assoc" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_eip" "eip" {
  tags = {
    Name = "elastic-ip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet_1.id
  tags = {
    Name = "nat-gateway"
  }
}