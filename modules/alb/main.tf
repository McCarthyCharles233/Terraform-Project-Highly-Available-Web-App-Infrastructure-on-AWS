resource "aws_alb" "my-alb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.vpc.sg-id]
  subnets            = [
    module.vpc.primary-subnet-id,
    module.vpc.secondary-subnet-id
  ]
  ip_address_type             = "ipv4"
  enable_deletion_protection = false

  tags = {
    Name = "My-App-LoadBalancer"
  }
}

module "vpc" {
  source = "../vpc"
}