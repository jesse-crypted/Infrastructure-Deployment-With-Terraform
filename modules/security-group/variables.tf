variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string

}

variable "security_group_id" {
  description = "The ID of the security group"
  type        = string
}


variable "egress_cidr" {
  description = "The CIDR block for egress traffic"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ingress_cidr" {
  description = "The CIDR block for ingress traffic"
  type        = string
}


variable "ingress_from_port" {
  description = "The starting port for ingress traffic"
  type        = number
}

variable "ingress_to_port" {
  description = "The ending port for ingress traffic"
  type        = number
}



variable "ingress_protocol" {
  description = "The protocol for ingress traffic"
  type        = string

}

variable "aws_region" {
  description = "The AWS region to use for EC2 Instance Connect"
  type        = string
  default     = "us-east-1"
}



