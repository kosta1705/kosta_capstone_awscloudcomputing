resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "private"
  }
}

###RDS Erweiterung Private Subents - oder separate .tf Datei?
# -----------------------------
# PRIVATE SUBNETS (für RDS)
# -----------------------------
resource "aws_subnet" "private_az2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_az2_rds_cidr
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "private-az2"
  }
}
