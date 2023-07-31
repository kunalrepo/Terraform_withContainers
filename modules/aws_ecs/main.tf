resource "aws_ecs_cluster" "prod" {
  name = "${var.ecs_cluster_name}-cluster"
}

resource "aws_launch_configuration" "ecs" {
  name = "${var.ecs_cluster_name}-cluster"
  image_id = lookup(var.ami, var.region)
  instance_type = var.instance_type
  security_groups = [var.sg_ecs_id]
  iam_instance_profile = var.iam_instance_profile_ecs_name
  key_name = var.keypair_name
  associate_public_ip_address = var.true
  user_data = "#!/bin/bash\necho ECS_CLUSTER='${var.ecs_cluster_name}-cluster' > /etc/ecs/ecs.config"
}

# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "4.15.1"
#     }
#   }
# }

# data "template_file" "app" {
#   template = file(var.template_file_app)
#   vars_template = {
#     docker_image_url_django = var.docker_image_url_django
#     region = var.region
#   }
# }

locals {
  template_vars = {
    docker_image_url_django = var.docker_image_url_django
    region = var.region
  }
}
locals {
  rendered_template = templatefile(var.template_file_app_path, local.template_vars)
}


resource "aws_ecs_task_definition" "app" {
  family = var.app_name
  container_definitions = local.rendered_template
}

resource "aws_ecs_service" "prod" {
  name = "${var.ecs_cluster_name}-service"
  cluster = aws_ecs_cluster.prod.id
  task_definition = aws_ecs_task_definition.app.arn
  iam_role = var.ecs_service_role_arn
  desired_count = var.app_count
  # depends_on = [aws_alb_listener.ecs-alb-http-listener, aws_iam_role_policy.ecs-service-role-policy]

  load_balancer {
    # depends_on = [module.Load_balancer]
    target_group_arn = var.alb_target_group_arn
    container_name = var.app_name
    container_port = var.port_8000
  }
}


