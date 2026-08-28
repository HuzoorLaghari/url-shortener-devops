variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "url-shortener"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_1" {
  description = "Private subnet 1 CIDR"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_2" {
  description = "Private subnet 2 CIDR"
  type        = string
  default     = "10.0.3.0/24"
}

variable "availability_zone_1" {
  description = "First Availability Zone"
  type        = string
  default     = "ap-southeast-1a"
}

variable "availability_zone_2" {
  description = "Second Availability Zone"
  type        = string
  default     = "ap-southeast-1b"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "shortener_prod"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "shortener_admin"
}

variable "db_password" {
  description = "RDS database password"
  type        = string
  sensitive   = true
}
