#variables for aws security groups

variable "sg_lg_name" {
  type = string
  default = "load_balancer_security_group"
}

variable "sg_lb_description" {
  type = string
  default = "Controls access to the ALB"
}

variable "sg_ecs_name" {
  type = string
  default = "ecs_security_group"
}

variable "sg_ecs_description" {
  type = string
  default = "Allows inbound access from the ALB only"
}

variable "vpc_id" {
  type = string
  #as of now we don't have the vpc id
}