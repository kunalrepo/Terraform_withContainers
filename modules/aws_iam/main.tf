resource "aws_iam_role" "ecs_host_role" {
  name = var.ecs_host_role_name
  assume_role_policy = file(var.ecs_host_role_path)
}

resource "aws_iam_role_policy" "ecs_instance_role_policy" {
  name = var.ecs_instance_role_policy_name
  policy = file(var.ecs_instance_role_policy_path)
  role = aws_iam_role.ecs_host_role.id
}

resource "aws_iam_role" "ecs_service_role" {
  name = var.ecs_service_role_name
  assume_role_policy = file(var.ecs_service_role_path)
}

resource "aws_iam_role_policy" "ecs_service_role_policy" {
  name = var.ecs_service_role_policy_name
  policy = file(var.ecs_service_role_policy_path)
  role = aws_iam_role.ecs_service_role.id
}

resource "aws_iam_instance_profile" "ecs" {
  name = var.ecs_name
  path = "/"
  role = aws_iam_role.ecs_host_role.name
}



