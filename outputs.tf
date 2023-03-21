output "vpc_id" {
    value = aws_vpc.Vpc1.id 
}

output "instance_ip_addr" {
    value = aws_instance.EC2_for_Public_Sub.public_ip
}

output "ami" {
    value = aws_instance.EC2_for_Public_Sub.ami
}

output "security_groups_id" {
    value = aws_security_group.allow_ssh_and_http.id
  
}