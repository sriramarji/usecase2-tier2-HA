resource "aws_instance" "web_server_1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id_1
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install nginx -y
        echo "<h1>I'm from Web Server1</h1>" | sudo tee /var/www/html/index.html
        sudo systemctl start nginx
        EOF
  tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "web_server_2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id_2
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install nginx -y
        echo "<h1>I'm from Web Server2</h1>" | sudo tee /var/www/html/index.html
        sudo systemctl start nginx
        EOF
  tags = {
    Name = "web-server-2"
  }
}

resource "aws_security_group" "web_sg" {
  vpc_id = var.vpc_id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be more restrictive in production
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be more restrictive in production
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}