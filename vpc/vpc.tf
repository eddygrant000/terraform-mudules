data "external" "myipaddr" {
  program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}

resource "aws_vpc" "default" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags ={
    Name = var.vpc_name
  }
}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.default.id
}

resource "aws_internet_gateway" "terra_igw" {
  vpc_id = aws_vpc.default.id

  tags ={
    Name = var.igw_name
  }
}
output "internet_gateway_id" {
  description = "The ID of the IGW"
  value       = "aws_internet_gateway.id"
}
resource "aws_subnet" "publicsubnet" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.subnets_cidr
  availability_zone       = var.azs
  map_public_ip_on_launch = "true"
  tags ={
    Name = var.subnet_name
  }
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_igw.id
  }
  tags ={
    Name = var.route_table_name
  }
}
resource "aws_security_group" "sg_pub" {
  name        = "sg_pub"
  description = "security group for public"
  vpc_id = aws_vpc.default.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${data.external.myipaddr.result.ip}/32"]
  }
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.public_rt.id
}
