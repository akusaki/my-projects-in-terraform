variable "cidr_block" {
    description = "Default cidr block for VPC1"
    type = string
    default = "10.10.0.0/16"
}


variable "cidr_block_for_PublicSub" {
    type = string
    default = "10.10.1.0/24"
}

variable "cidr_block_for_PrivateSub" {
    type = string
    default = "10.10.2.0/24"
}

variable "Availability_zone_for_Pub" {
    description = "us-east-1a Availability zone"
    type = string 
    default = "us-east-1a"
}

variable "Availability_zone_for_Private" {
    description = "us-east-1b Availability zone"
    type = string
    default = "us-east-1b"
}

variable "key_pair_name" {
  description = "Name for the SSH key pair"
  type        = string
  default = "terraform_ec2_key"
}

variable "instance_type" {
    description = "Default type of instance"
    type = string
    default = "t2.micro"
}
