resource "aws_lb" "prod" {
  name = "${var.ecs_cluster_name}-alb"
  load_balancer_type = var.lbtype
  internal = var.false
  security_groups = [var.sg_lb_id]
  subnets = [var.public_subnet_1_id, var.public_subnet_2_id]
}

resource "aws_alb_target_group" "default_tg" {
  name = "${var.ecs_cluster_name}-tg"
  port = var.port_80
  protocol = var.HTTP
  vpc_id = var.vpc_id

  health_check {
    path                = var.health_check_path
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    matcher             = "200"
  }
}

resource "aws_alb_listener" "ecs_alb_http_listener" {
  load_balancer_arn = aws_lb.prod.id
  port = var.port_80
  protocol = var.HTTP
  depends_on = [aws_alb_target_group.default_tg]

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.default_tg.arn
  }
}


