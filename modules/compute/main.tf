resource "aws_instance" "servers" {
  count = var.instance_count

  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash
  dnf install -y nginx
  systemctl enable --now nginx
  echo "<h1>Hello World from Server ${count.index + 1}</h1>" > /usr/share/nginx/html/index.html
EOF



  tags = {
    Name = "web-server-${count.index + 1}"
  }
}


