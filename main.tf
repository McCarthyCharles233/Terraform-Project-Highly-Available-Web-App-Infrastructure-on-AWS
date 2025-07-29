
module "ec2" {
  source = "./modules/ec2"
  ami_value = var.ami_value
  instance_type_value = var.instance_type_value
}

module "alb" {
  source = "./modules/alb"
}