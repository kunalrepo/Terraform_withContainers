output "ecs_service_role_arn" {
  value = aws_iam_role.ecs_service_role.arn
}

output "iam_instance_profile_ecs_name" {
  value = aws_iam_instance_profile.ecs.name
}