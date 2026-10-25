output "ec2_instance_ids" {
  value = module.compute.instance_ids
}

output "ec2_public_ips" {
  value = module.compute.public_ips
}

output "ec2_private_ips" {
  value = module.compute.private_ips
}