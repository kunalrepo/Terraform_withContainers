variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "production"
}
variable "ami" {
  description = "Which AMI to spawn."
  default = {
    us-east-2 = "ami-03a0c45ebc70f98ea"
  }
}

variable "instance_type" {
  default = "t2.micro"
}
variable "docker_image_url_django" {
  description = "Docker image to run in the ECS cluster"
  default     = "967427159842.dkr.ecr.us-east-2.amazonaws.com/django-app"
}
variable "app_count" {
  description = "Number of Docker containers to run"
  default     = 2
}

variable "region" {
  description = "this would be the ohio"
  default = "us-east-2"
}

variable "sg_ecs_id" {
  type = string
}

variable "iam_instance_profile_ecs_name" {
  type = string
}
variable "true" {
  type = bool
  default = true
}

variable "keypair_name" {
  type = string
}

variable "template_file_app_path" {
  type = string
  default = "/Users/kunal/Desktop/Desktop/Devops_Project/Terraform_Project2/Terraform/modules/aws_ecs/templates/django_app.json.tpl"
}

variable "app_name" {
  type = string
  default = "django-app"
}

variable "port_8000" {
  type = string
  default = "8000"
}

variable "ecs_service_role_arn" {
  type = string
}

variable "alb_target_group_arn" {
  type = string
}