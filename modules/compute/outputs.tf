output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.servers[*].id
}

output "public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.servers[*].public_ip
}

output "private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = aws_instance.servers[*].private_ip
}