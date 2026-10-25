module "network" {
  source = "./modules/network"

  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone   = "us-east-1a"
}

module "compute" {
  source = "./modules/compute"

  ami               = var.ami_id
  instance_type     = "t3.micro"
  instance_count    = 2
  subnet_id         = module.network.public_subnet_id
  security_group_id = module.security_group.security_group_id

}

module "security_group" {
  source = "./modules/security-group"

  vpc_id              = module.network.vpc_id
  security_group_name = "web-server-sg"
  security_group_id   = module.security_group.security_group_id
  ingress_cidr        = "0.0.0.0/0"
  ingress_from_port   = 80
  ingress_to_port     = 80
  ingress_protocol    = "tcp"

}

