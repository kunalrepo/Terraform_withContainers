variable "region" {
  description = "this would be the ohio"
  default = "us-east-2"
}
#---------AWS_VPC variables------------------------#
variable "cidr_block"{
  type = string
  default = "10.0.0.0/16"
}

variable "true" {
  type = bool
  default = true
}

variable "vpc_tag" {
  type = map(any)
  default = {
    "Name" = "prod_vpc"
  }
}


#---------AWS_SUBNET variables------------------------#

variable "public_subnet_1_cidr" {
  description = "CIDR Block for Public Subnet 1"
  default     = "10.0.1.0/24"
}
variable "public_subnet_2_cidr" {
  description = "CIDR Block for Public Subnet 2"
  default     = "10.0.2.0/24"
}
variable "private_subnet_1_cidr" {
  description = "CIDR Block for Private Subnet 1"
  default     = "10.0.3.0/24"
}
variable "private_subnet_2_cidr" {
  description = "CIDR Block for Private Subnet 2"
  default     = "10.0.4.0/24"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-2b", "us-east-2c"]
}

variable "vpc_id" {
  type = string
  #as of now we don't have the vpc id
}


#--------------AWS_SG variables-----------------------------#

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

#--------------AWS_RT variables-----------------------------#

variable "public_subnet_1_id" {
  type = string
  # as we don't have a subnet id
}

variable "public_subnet_2_id" {
  type = string
}

variable "private_subnet_1_id" {
  type = string
}

variable "private_subnet_2_id" {
  type = string
}

variable "associate_with_private_ip" {
  type = string
  default = "10.0.0.5"
}

variable "destination_cidr_block" {
  type = string
  default = "0.0.0.0/0"
}


#--------------AWS_lb variables-----------------------------#

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

variable "port_80" {
  type = string
  default = "80"
}

variable "HTTP" {
  type = string
  default = "HTTP"
}

variable "health_check_path" {
  description = "Health check path for the default target group"
  default     = "/ping/"
}

#-------------------AWS_IAM variables ----------------#

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


#----------------AWS_ECS variables -----------------------#

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

variable "sg_ecs_id" {
  type = string
}

variable "iam_instance_profile_ecs_name" {
  type = string
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

#----------AWS_Cloudwatch variables----------------------#

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

#----------AWS_Autoscaling variables--------------------

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

#----------AWS_Keypair variables--------------------#

variable "ssh_pubkey_file" {
  description = "Path to an SSH public key"
  default     = "/Users/kunal/Desktop/Desktop/Devops_Project/Terraform_Project2/Terraform/modules/aws_keypair/ohio-region-key-pair.pub"
}

