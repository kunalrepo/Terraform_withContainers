resource "aws_cloudwatch_log_group" "django_log_group" {
  name = var.django_log_group_name
  retention_in_days = var.log_retention_in_days
}

resource "aws_cloudwatch_log_stream" "django_log_stream" {
  name = var.django_log_stream_name
  log_group_name = aws_cloudwatch_log_group.django_log_group.name
}


