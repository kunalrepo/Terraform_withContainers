variable "ecs_host_role_name" {
  type = string 
  default = "ecs_host_role_prod"
}

variable "ecs_host_role_path" {
  type = string
  default = "/Users/kunal/Desktop/Desktop/Devops_Project/Terraform_Project2/Terraform/modules/aws_policies/ecs-role.json"
}

variable "ecs_instance_role_policy_name" {
  type = string 
  default = "ecs_host_role_prod"
}

variable "ecs_instance_role_policy_path" {
  type = string
  default = "/Users/kunal/Desktop/Desktop/Devops_Project/Terraform_Project2/Terraform/modules/aws_policies/ecs-instance-role-policy.json"
}

variable "ecs_service_role_name" {
  type = string 
  default = "ecs_host_role_prod"
}

variable "ecs_service_role_path" {
  type = string
  default = "/Users/kunal/Desktop/Desktop/Devops_Project/Terraform_Project2/Terraform/modules/aws_policies/ecs-role.json"
}

variable "ecs_service_role_policy_name" {
  type = string 
  default = "ecs_host_role_prod"
}

variable "ecs_service_role_policy_path" {
  type = string
  default = "/Users/kunal/Desktop/Desktop/Devops_Project/Terraform_Project2/Terraform/modules/aws_policies/ecs-service-role-policy.json"
}

variable "ecs_name" {
  type = string
  default = "ecs_instance_profile_prod"
}