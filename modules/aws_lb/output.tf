output "alb_hostname" {
  value = aws_lb.prod.dns_name
}

# output "aws_alb_target_group_arn" {
#   value = aws_alb_target_group.default_tg.arn
# }

output "aws_alb_target_group_arn" {
  value = aws_alb_target_group.default_tg.arn
}