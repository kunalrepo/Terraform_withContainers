module "Vpc" {
  source = "./modules/aws_vpc"
  cidr_block = var.cidr_block
  true = var.true
  vpc_tag = var.vpc_tag
}

module "Subnet" {
  source = "./modules/aws_subnet"
  depends_on = [ module.Vpc ]
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  availability_zones = var.availability_zones
  vpc_id = module.Vpc.vpc_id
}

module "Security_Group" {
  source = "./modules/aws_sg"
  depends_on = [ module.Vpc ]
  sg_lg_name = var.sg_lg_name
  sg_lb_description = var.sg_lb_description
  sg_ecs_name = var.sg_ecs_name
  sg_ecs_description = var.sg_ecs_description
  vpc_id = module.Vpc.vpc_id
}

module "Route_Table" {
  source = "./modules/aws_rt"
  depends_on = [ module.Vpc, module.Subnet ]
  public_subnet_1_id = module.Subnet.public_subnet_1
  public_subnet_2_id = module.Subnet.public_subnet_2
  private_subnet_1_id = module.Subnet.private_subnet_1
  private_subnet_2_id = module.Subnet.private_subnet_2
  vpc_id = module.Vpc.vpc_id
  true = var.true
  associate_with_private_ip = var.associate_with_private_ip
  destination_cidr_block = var.destination_cidr_block
}

module "Load_balancer" {
  source = "./modules/aws_lb"
  depends_on = [ module.Vpc, module.Subnet, module.Security_Group ]
  ecs_cluster_name = var.ecs_cluster_name
  lbtype = var.lbtype
  false = var.false
  sg_lb_id = module.Security_Group.sg_lb_id
  public_subnet_1_id = module.Subnet.public_subnet_1
  public_subnet_2_id = module.Subnet.public_subnet_2
  port_80 = var.port_80
  HTTP = var.HTTP
  vpc_id = module.Vpc.vpc_id
  health_check_path = var.health_check_path
}

module "Keypair" {
   source = "./modules/aws_keypair"
  ecs_cluster_name = var.ecs_cluster_name
  ssh_pubkey_file = var.ssh_pubkey_file
}

module "IAM" {
  source = "./modules/aws_iam"
  ecs_host_role_name = var.ecs_host_role_name
  ecs_host_role_path = var.ecs_host_role_path
  ecs_instance_role_policy_name = var.ecs_instance_role_policy_name
  ecs_instance_role_policy_path = var.ecs_instance_role_policy_path
  ecs_service_role_name = var.ecs_service_role_name
  ecs_service_role_path = var.ecs_service_role_path
  ecs_service_role_policy_name = var.ecs_service_role_policy_name
  ecs_service_role_policy_path = var.ecs_service_role_policy_path
  ecs_name = var.ecs_cluster_name
}


module "ECS" {
  source = "./modules/aws_ecs"
  depends_on = [ module.IAM, module.Load_balancer ]
  ecs_cluster_name = var.ecs_cluster_name
  ami = var.ami
  instance_type = var.instance_type
  docker_image_url_django = var.docker_image_url_django
  app_count = var.app_count
  region = var.region
  sg_ecs_id = module.Security_Group.sg_ecs_id
  iam_instance_profile_ecs_name = module.IAM.iam_instance_profile_ecs_name
  true = var.true
  keypair_name = module.Keypair.keypair_name
  template_file_app_path = var.template_file_app_path
  app_name = var.app_name
  port_8000 = var.port_8000
  ecs_service_role_arn = module.IAM.ecs_service_role_arn
  alb_target_group_arn = module.Load_balancer.aws_alb_target_group_arn
  
}

module "Cloudwatch" {
  source = "./modules/aws_cloudwatch"
  django_log_group_name = var.django_log_group_name
  log_retention_in_days = var.log_retention_in_days
  django_log_stream_name = var.django_log_stream_name
}

module "Autoscaling" {
  source = "./modules/aws_autoscaling"
  depends_on = [ module.ECS, module.Subnet ]
  ecs_cluster_name = var.ecs_cluster_name
  autoscale_min = var.autoscale_min
  autoscale_max = var.autoscale_max
  autoscale_desired = var.autoscale_desired
  EC2 = var.EC2
  ecs_launch_configuration_name = module.ECS.ecs_launch_configuration_name
  public_subnet_1_id = module.Subnet.public_subnet_1
  public_subnet_2_id = module.Subnet.public_subnet_2
}
