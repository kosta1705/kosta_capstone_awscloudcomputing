variable "aws_region" {
description = "AWS region to deploy into"
type = string
}

variable "ami_id" {
description = "AMI ID to use for the EC2 instance"
type = string
}

variable "instance_type" {
description = "EC2 instance type"
type = string
}
variable "key_name" {
description = "Key pair name for SSH access"
type = string
}

variable "user_data" {
description = "User data for wordpress"
type = string
}

variable "vpc_cidr" {
description = "vpc cdir"
type = string
}

variable "public_subnet_cidr" {
type = string
}

variable "private_subnet_cidr" {
type = string
}

variable "my_ip" {
type = string
}

variable "db_user" {
    type=string
}

variable "db_password" {
    type=string
    sensitive=true
}

###Erweiterung mit RDS
# variable "public_subnet_az2_rds_cidr" {
#   type = string
# }
variable "private_subnet_az2_rds_cidr" {
  type = string
}
