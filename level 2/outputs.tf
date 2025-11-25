output "rds_endpoint" {
  value = aws_db_instance.wordpress_rds.address
}

output "rds_port" {
  value = aws_db_instance.wordpress_rds.port
}

# output "rds_db_name" {
#   value = var.db_name
# }
