#security group lb & ecs id's will be used by aws_load_balancer module

output "sg_lb_id" {
  value = aws_security_group.lb.id
}

output "sg_ecs_id" {
  value = aws_security_group.ecs.id
}