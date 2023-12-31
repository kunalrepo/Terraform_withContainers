variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "production"
}

variable "autoscale_min" {
  description = "Minimum autoscale (number of EC2)"
  default     = "1"
}
variable "autoscale_max" {
  description = "Maximum autoscale (number of EC2)"
  default     = "2"
}
variable "autoscale_desired" {
  description = "Desired autoscale (number of EC2)"
  default     = "2"
}

variable "EC2" {
  type = string
  default = "EC2"
}

variable "ecs_launch_configuration_name"  {
  type = string
}

variable "public_subnet_1_id" {
  type = string
  # as we don't have a subnet id
}

variable "public_subnet_2_id" {
  type = string
}