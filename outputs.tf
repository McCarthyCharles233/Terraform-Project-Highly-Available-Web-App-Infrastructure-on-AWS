output "public-address-1" {
  value = module.ec2.public-address-1
}

output "public-address-2" {
  value = module.ec2.public-address-2
}

output "vpc-id" {
  value = module.vpc.vpc-id
}

output "primary-subnet-id" {
  value = module.vpc.primary-subnet-id
}

output "secondary-subnet-id" {
  value = module.vpc.secondary-subnet-id
}

output "sg-id" {
  value = module.vpc.sg-id
}

output "alb-dns" {
  value = module.alb.alb-dns
}


module "vpc" {
  source = "./modules/vpc"
}