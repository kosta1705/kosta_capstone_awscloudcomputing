resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone       = "${var.aws_region}b"

  tags = {
    Name = "private"
  }
}
