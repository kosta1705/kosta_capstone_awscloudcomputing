resource "aws_instance" "wordpress" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  key_name      = var.key_name

  user_data = file(var.user_data)
  #user_data = file("${path.module}/${var.user_data}")

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Capstone-tf-Instance"
  }
}

