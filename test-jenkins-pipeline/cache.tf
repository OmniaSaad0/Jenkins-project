resource "aws_elasticache_cluster" "redis" {
  cluster_id         = "redis"
  engine             = "redis"
  node_type          = var.elasticache_instance_type
  num_cache_nodes    = 1
  subnet_group_name  = aws_elasticache_subnet_group.redis_subnet.name
  security_group_ids = [aws_security_group.cache_sg.id]
}

resource "aws_elasticache_subnet_group" "redis_subnet" {
  name       = "redis-subnet"
  subnet_ids = [module.network.private_subnet1, module.network.private_subnet2]

  tags = {
    Name = "redis-subnet-group"
  }
}
