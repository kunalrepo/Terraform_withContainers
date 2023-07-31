variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "production"
}

variable "ssh_pubkey_file" {
  description = "Path to an SSH public key"
  default     = "/Users/kunal/Desktop/Desktop/Devops_Project/Terraform_Project2/Terraform/modules/aws_keypair/ohio-region-key-pair.pub"
}