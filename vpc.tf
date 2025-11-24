#create VPC
resource "aws_vpc" "terra_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="My_terra_VPC"
  }
}

#create public_subnet
resource "aws_subnet" "public_terra" {
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name="public-subnet"
  }
}

#create private_subnet
resource "aws_subnet" "private_terra" {
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name="private-subnet"
  }
}

#Create IGW
resource "aws_internet_gateway" "terra-IGW" {
  vpc_id = aws_vpc.terra_vpc.id
  tags={
    Name = "My - terra_IGW"
  } 
}

#creating route table
resource "aws_route_table" "route_table_public_route" {
  vpc_id = aws_vpc.terra_vpc.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id= aws_internet_gateway.terra-IGW.id
  }
  tags = {
    Name="terra-route-table"
    }
  }

#associate route table to subnet
resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.public_terra.id
  route_table_id = aws_route_table.route_table_public_route.id
}
