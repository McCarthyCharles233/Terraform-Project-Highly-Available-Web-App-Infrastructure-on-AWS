output "vpc-id" {
  value = aws_vpc.my-vpc.id
}

output "primary-subnet-id" {
  value = aws_subnet.subnet-1.id
}

output "secondary-subnet-id" {
  value = aws_subnet.subnet-2.id
}

output "sg-id" {
  value = aws_security_group.my-sg.id
}