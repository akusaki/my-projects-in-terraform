resource "aws_security_group" "allow_ssh_and_http" {
  name        = "allow_ssh"
  description = "Allow ssh to instances"
  vpc_id      = aws_vpc.Vpc1.id

  ingress {
    description      = "allow_SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  

  tags = {
    Name = "Aku's security group"
  }
}