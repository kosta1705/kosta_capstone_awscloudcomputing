resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public"
  }
}

###RDS Erweiterung Private Subents - oder separate .tf Datei?
# -----------------------------
# PUBLIC SUBNETS (für EC2 / NAT / ALB)
# -----------------------------
# resource "aws_subnet" "public_az2" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = var.public_subnet_az2_rds_cidr
#   availability_zone       = "${var.aws_region}b"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "public-az2"
#   }
# }