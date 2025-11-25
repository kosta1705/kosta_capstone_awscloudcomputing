###Advanced Project Level 2
#subnet group
resource "aws_db_subnet_group" "wordpress_rds_subnet_group" {
  name       = "wordpress-rds-subnet-group"
  subnet_ids = [
    aws_subnet.private.id,
    aws_subnet.private_az2.id
  ]
}


###RDS Security Group
resource "aws_security_group" "rds_sg" {
  name        = "wordpress-rds-sg"
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.main.id

  # Allow only EC2 Security Group to connect to my db
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wordpress-rds-sg"
  }
}

#RDS
resource "aws_db_instance" "wordpress_rds" {
  identifier              = "wordpress-db"
  engine                  = "mariadb"
  engine_version          = "10.6"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  max_allocated_storage   = 100
  #storage_type            = "gp3"

#Credentials
  db_name                 = "wordpress"
  username                = var.db_user
  password                = var.db_password

  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.wordpress_rds_subnet_group.name
  
  multi_az = true
  publicly_accessible = false
  skip_final_snapshot = true
  storage_encrypted = true

  tags = {
    Name = "wordpress-rds"
  }
}
