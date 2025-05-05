variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnets" {
  description = "Map of public and private subnets"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    type              = string  # Should be "public" or "private"
  }))
}


variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "key_name" {
  description = "EC2 SSH key name"
  type        = string
}

variable "database_instance_class" {
  description = "RDS instance type"
  type        = string
}

variable "elasticache_instance_type" {
  description = "ElastiCache instance type"
  type        = string
}

variable "ses_verified_email" {
  description = "Email address to verify in AWS SES"
  type        = string
}

variable "receiver_email" {
  description = "Email address to receive notifications"
  type        = string
}
