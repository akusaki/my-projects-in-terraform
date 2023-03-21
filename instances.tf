resource "tls_private_key" "tls_connector" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "terraform_ec2_key" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.tls_connector.public_key_openssh

  tags = {
    Owner = "Aku's key"
  }
}

resource "local_file" "terraform_ec2_key_file" {
  content  = tls_private_key.tls_connector.private_key_pem
  filename = "terraform_ec2_key.pem"

  provisioner "local-exec" {
    command = "chmod 400 terraform_ec2_key.pem"
  }
}



data "aws_ami" "amazon_linux" {
    owners = ["self"]

  filter {
    name   = "name"
    values = ["*amazon*"]
  }
}

resource "aws_instance" "EC2_for_Public_Sub" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.Public_subnet.id
  security_groups = [aws_security_group.allow_ssh_and_http.id]
  associate_public_ip_address = true
  tags = {
    Name = "Aku's"
  }
}
