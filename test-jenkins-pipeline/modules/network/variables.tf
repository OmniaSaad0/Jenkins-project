variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "region" {
  type = string
}

variable "public_subnets" {
  type = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "private_subnets" {
  type = list(string)
  description = "List of CIDR blocks for private subnets"
}

