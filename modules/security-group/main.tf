data "aws_ip_ranges" "ec2_instance_connect" {
  regions  = [var.aws_region]
  services = ["ec2_instance_connect"]
}

resource "aws_vpc_security_group_ingress_rule" "ssh_instance_connect" {
  for_each = toset(data.aws_ip_ranges.ec2_instance_connect.cidr_blocks)

  security_group_id = aws_security_group.main.id
  description       = "SSH from EC2 Instance Connect"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = each.value
}


resource "aws_security_group" "main" {
  name        = var.security_group_name
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.security_group_name
  }
}


resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = var.egress_cidr
  ip_protocol = "-1"
}


resource "aws_vpc_security_group_ingress_rule" "ingress_rule" {
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = var.ingress_cidr
  from_port   = var.ingress_from_port
  ip_protocol = var.ingress_protocol
  to_port     = var.ingress_to_port
}
