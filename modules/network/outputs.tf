output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.subnet-1-public.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.subnet-2-private.id
}