#vpc id will be used by aws_subnet, aws_security_group, aws_route_table, aws load_balancer

output "vpc_id" {
  value = aws_vpc.prod_vpc.id
}