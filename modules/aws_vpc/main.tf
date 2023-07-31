# this block will create an aws vpc

resource "aws_vpc" "prod_vpc" {
  cidr_block = var.cidr_block
  enable_dns_support = var.true
  enable_dns_hostnames = var.true
  tags = var.vpc_tag
}

