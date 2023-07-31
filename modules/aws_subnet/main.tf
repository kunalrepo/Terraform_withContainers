# this block will create a public subnet 

resource "aws_subnet" "public_subnet_1" {
  cidr_block = var.public_subnet_1_cidr
  vpc_id = var.vpc_id
  availability_zone = var.availability_zones[0]
}

# this block will create another public subnet 

resource "aws_subnet" "public_subnet_2" {
  cidr_block = var.public_subnet_2_cidr
  vpc_id = var.vpc_id
  availability_zone = var.availability_zones[1]
}

# this block will create a private subnet 

resource "aws_subnet" "private_subnet_1" {
  cidr_block = var.private_subnet_1_cidr
  vpc_id = var.vpc_id
  availability_zone = var.availability_zones[0]
}

# this block will create another private subnet 

resource "aws_subnet" "private_subnet_2" {
  cidr_block = var.private_subnet_2_cidr
  vpc_id = var.vpc_id
  availability_zone = var.availability_zones[1]
}