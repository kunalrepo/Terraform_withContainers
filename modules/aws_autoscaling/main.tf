resource "aws_autoscaling_group" "ecs-cluster" {
  name = "${var.ecs_cluster_name}_auto_scaling_group"
  min_size = var.autoscale_min
  max_size = var.autoscale_max
  desired_capacity = var.autoscale_desired
  health_check_type = var.EC2
  launch_configuration = var.ecs_launch_configuration_name
  vpc_zone_identifier = [var.public_subnet_1_id, var.public_subnet_2_id]
}

