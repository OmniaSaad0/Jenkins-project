resource "aws_db_instance" "db" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.database_instance_class
  username               = "admin"
  password               = "password123"
  parameter_group_name   = "default.mysql8.0"
  publicly_accessible    = false
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "db-subnet"
  subnet_ids = [module.network.private_subnet1, module.network.private_subnet2]

  tags = {
    Name = "db-subnet-group"
  }
}
