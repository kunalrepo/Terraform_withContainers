variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "production"
}

variable "lbtype" {
  type = string
  default = "application"
}

variable "false" {
    type = bool
    default = false
}

variable "sg_lb_id" {
  type = string
}

variable "public_subnet_1_id" {
  type = string
}

variable "public_subnet_2_id" {
  type = string
}

variable "port_80" {
  type = string
  default = "80"
}

variable "HTTP" {
  type = string
  default = "HTTP"
}

variable "vpc_id" {
  type = string
  #as of now we don't have the vpc id
}

variable "health_check_path" {
  description = "Health check path for the default target group"
  default     = "/ping/"
}