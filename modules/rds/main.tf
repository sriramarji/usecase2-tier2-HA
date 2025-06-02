resource "aws_db_instance" "mysql" {
  
  storage_type         = "gp2"  
  allocated_storage    = 20
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  engine               = "mysql"
  engine_version       = "8.0.40"
  instance_class       = var.db_instance_type
  identifier           = "mysql-instance" 
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot  = true
  multi_az             = true 
  publicly_accessible  = false
  tags = {
    Name = "mysql-instance"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [var.web_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}


