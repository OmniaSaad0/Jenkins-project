aws_region                = "us-east-1"
instance_type             = "t2.micro"
ami_id                    = "ami-0f9de6e2d2f067fca"
key_name                  = "jenkins-slave"
vpc_cidr                  = "10.0.0.0/16"
database_instance_class   = "db.t3.micro"
elasticache_instance_type = "cache.t3.micro"
ses_verified_email        = "saadomnia509@gmail.com"
receiver_email            = "saadomnia509@gmail.com"




subnets = {
  "public1"  = { cidr_block = "10.0.1.0/24", availability_zone = "us-east-1a", type = "public" }
  "public2"  = { cidr_block = "10.0.4.0/24", availability_zone = "us-east-1d", type = "public" }
  "private1" = { cidr_block = "10.0.2.0/24", availability_zone = "us-east-1b", type = "private" }
  "private2" = { cidr_block = "10.0.3.0/24", availability_zone = "us-east-1c", type = "private" }
}