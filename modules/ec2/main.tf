
resource "aws_instance" "my-first-ec2" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  subnet_id = module.vpc.primary-subnet-id
  associate_public_ip_address = true

  tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "my-second-ec2" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  subnet_id = module.vpc.secondary-subnet-id
  associate_public_ip_address = true

  tags = {
    Name = "web-server-2"
  }
}

module "vpc" {
  source = "../vpc"
}