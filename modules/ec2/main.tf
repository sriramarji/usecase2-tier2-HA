resource "aws_security_group" "web_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port  = 22
    to_port    = 22
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  } 
  tags = {
    Name = "web-sg"
  }
}

resource "aws_instance" "web_server_1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id_1
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data = file("scripts/userdata.sh")
  tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "web_server_2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id_2
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data = file("scripts/userdata.sh")
  tags = {
    Name = "web-server-2"
  }
}