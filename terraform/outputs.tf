output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public.id
}

output "private_subnet_1_id" {
  description = "Private subnet 1 ID"
  value       = aws_subnet.private_1.id
}

output "private_subnet_2_id" {
  description = "Private subnet 2 ID"
  value       = aws_subnet.private_2.id
}

output "app_instance_id" {
  description = "Application EC2 instance ID"
  value       = aws_instance.app.id
}

output "app_public_ip" {
  description = "Application EC2 public IP"
  value       = aws_instance.app.public_ip
}

output "app_public_dns" {
  description = "Application EC2 public DNS"
  value       = aws_instance.app.public_dns
}

output "rds_endpoint" {
  description = "RDS MySQL endpoint"
  value       = aws_db_instance.mysql.address
}

output "rds_port" {
  description = "RDS MySQL port"
  value       = aws_db_instance.mysql.port
}
