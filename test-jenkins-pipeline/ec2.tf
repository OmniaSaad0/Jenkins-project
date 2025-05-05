resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = module.network.public_subnet1
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "bastion"
  }

  provisioner "local-exec" {
    command = "echo Bastion Public IP: ${self.public_ip} >> EC2_IPs.txt"
  }
}

resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = module.network.private_subnet1
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "app"
  }
  
  provisioner "local-exec" {
    command = "echo app Private IP: ${self.private_ip} >> EC2_IPs.txt"
  }
}
