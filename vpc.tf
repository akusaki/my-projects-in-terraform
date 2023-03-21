resource "aws_vpc" "Vpc1" {
  cidr_block = var.cidr_block
  tags = {
    "name" = "Akylbek's Vpc1"
  }
}

resource "aws_internet_gateway" "gateway_for_Vpc1" {
  vpc_id = aws_vpc.Vpc1.id

  tags = {
    Name = "Aku's gateway"
  }
  depends_on = [
    aws_vpc.Vpc1
  ]
}

resource "aws_subnet" "Public_subnet" {
  vpc_id     = aws_vpc.Vpc1.id
  cidr_block = var.cidr_block_for_PublicSub
  availability_zone = var.Availability_zone_for_Pub

  tags = {
    Name = "Aku's Public subnet"
  }
  depends_on = [
    aws_vpc.Vpc1
  ]
}


resource "aws_subnet" "Private_subnet" {
  vpc_id     = aws_vpc.Vpc1.id
  cidr_block = var.cidr_block_for_PrivateSub
  availability_zone = var.Availability_zone_for_Private

  tags = {
    Name = "Aku's Private subnet"
  }
  depends_on = [
    aws_vpc.Vpc1
  ]
}


resource "aws_default_route_table" "Route_table_for_Vpc1" {
  default_route_table_id = aws_vpc.Vpc1.main_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway_for_Vpc1.id
  }

  tags = {
    Name = "Aku's first Route"
  }
  depends_on = [
    aws_vpc.Vpc1
  ]
}

resource "aws_route_table_association" "for_public" {
  subnet_id      = aws_subnet.Public_subnet.id
  route_table_id = aws_vpc.Vpc1.main_route_table_id
  depends_on = [
    aws_subnet.Public_subnet
  ]
}