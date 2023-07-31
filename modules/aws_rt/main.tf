# Route tables for the subnets
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id
}

# Associate the newly created route tables to the subnets
resource "aws_route_table_association" "public_route-1-association" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = var.public_subnet_1_id
}

resource "aws_route_table_association" "public_route-2-association" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = var.public_subnet_2_id
}

resource "aws_route_table_association" "private_route-1-association" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id = var.private_subnet_1_id
}

resource "aws_route_table_association" "private_route-2-association" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id = var.private_subnet_2_id
}

# Internet Gateway for the public subnet
resource "aws_internet_gateway" "prod_igw" {
  vpc_id = var.vpc_id
}

# Elastic IP
resource "aws_eip" "elastic_ip_for_nat_gw" {
  vpc = var.true
  associate_with_private_ip = var.associate_with_private_ip
  depends_on = [ aws_internet_gateway.prod_igw ]
}

# NAT gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.elastic_ip_for_nat_gw.id
  subnet_id = var.public_subnet_1_id
  depends_on = [ aws_eip.elastic_ip_for_nat_gw ]
}

resource "aws_route" "nat_gw_route" {
  route_table_id = aws_route_table.private_rt.id
  nat_gateway_id = aws_nat_gateway.nat_gw.id
  destination_cidr_block = var.destination_cidr_block
}


# Route the public subnet traffic through the Internet Gateway
resource "aws_route" "public_internet_igw_route" {
  route_table_id = aws_route_table.public_rt.id
  gateway_id = aws_internet_gateway.prod_igw.id
  destination_cidr_block = var.destination_cidr_block
}