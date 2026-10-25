variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_route_table_cidr" {
  description = "The CIDR block for the public route table"
  type        = string
  default     = "0.0.0.0/0"
}

variable "availability_zone" {
  description = "The availability zone for the subnets"
  type        = string

}