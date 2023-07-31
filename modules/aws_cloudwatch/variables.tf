variable "django_log_group_name" {
  type = string
  default = "/ecs/django-app"
}

variable "log_retention_in_days" {
  default = 30
}

variable "django_log_stream_name" {
  type = string
  default = "django-app-log-stream"
}