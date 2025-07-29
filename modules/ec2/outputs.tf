output "public-address-1" {
  value = aws_instance.my-first-ec2.public_ip
}

output "public-address-2" {
  value = aws_instance.my-second-ec2.public_ip
}