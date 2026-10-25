variable "ami" {
  description = "Amazon Machine image to use for ec2 instance"
  type        = string
  default     = "ami-08c46876c64a927b8"
}

variable "instance_type" {
  description = "Type of instance to use for ec2 instance"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

# variable "private_subnet_id" {
#   description = "ID of the private subnet"
#   type = string
# }


variable "instance_count" {
  type    = number
  default = 2
}

variable "security_group_id" {
  description = "ID of the security group"
  type        = string
}