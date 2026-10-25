resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}


resource "aws_subnet" "subnet-1-public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "subnet-2-private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet"
  }
}


resource "aws_route_table" "route-table-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.public_route_table_cidr
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = {
    Name = "route-table-public"
  }
}

resource "aws_route_table_association" "subnet-1-association" {
  subnet_id      = aws_subnet.subnet-1-public.id
  route_table_id = aws_route_table.route-table-public.id
}


resource "aws_route_table" "route-table-private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "route-table-private"
  }
}

resource "aws_route_table_association" "subnet-2-association" {
  subnet_id      = aws_subnet.subnet-2-private.id
  route_table_id = aws_route_table.route-table-private.id
}