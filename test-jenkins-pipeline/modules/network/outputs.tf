output "vpc_id" {
  value = aws_vpc.my-vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.my-vpc.cidr_block
}


output "public_subnet1" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet2" {
  value = aws_subnet.public_subnet2.id
}

output "private_subnet1" {
  value = aws_subnet.private_subnet1.id
}

output "private_subnet2" {
  value = aws_subnet.private_subnet2.id
}