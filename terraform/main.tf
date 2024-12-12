module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = var.vpc_cidr
  subnet1_cidr = var.subnet1_cidr
  subnet2_cidr = var.subnet2_cidr
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source               = "./modules/iam"
  execution_role_name  = var.execution_role_name
  execution_policy_arn = var.execution_policy_arn
}

module "load_balancer" {
  source                          = "./modules/load_balancer"
  lb_name                         = var.lb_name
  security_groups                 = [module.security_groups.ecs_security_group_id]
  subnets                         = module.vpc.public_subnets
  certificate_arn                 = var.certificate_arn
  target_group_name               = var.target_group_name
  target_group_port               = var.target_group_port
  target_group_protocol           = var.target_group_protocol
  vpc_id                          = module.vpc.vpc_id
  health_check_path               = var.health_check_path
  health_check_interval           = var.health_check_interval
  health_check_timeout            = var.health_check_timeout
  health_check_healthy_threshold  = var.health_check_healthy_threshold
  health_check_unhealthy_threshold = var.health_check_unhealthy_threshold
  health_check_matcher            = var.health_check_matcher
  http_redirect_port              = var.http_redirect_port
  https_listener_port             = var.https_listener_port
  ssl_policy                      = var.ssl_policy
  load_balancer_type              = var.load_balancer_type
  is_internal                     = var.is_internal
}


module "ecs" {
  source                                = "./modules/ecs"
  cluster_name                          = var.cluster_name
  task_family                           = var.task_family
  network_mode                          = var.network_mode
  compatibilities                       = var.compatibilities
  task_cpu                              = var.task_cpu
  task_memory                           = var.task_memory
  execution_role_arn                    = module.iam.execution_role_arn
  cpu_architecture                      = var.cpu_architecture
  operating_system_family               = var.operating_system_family
  container_definitions                 = jsonencode(var.container_definitions)
  service_name                          = var.service_name
  desired_count                         = var.desired_count
  launch_type                           = var.launch_type
  health_check_grace_period_seconds     = var.health_check_grace_period_seconds
  deployment_type                       = var.deployment_type
  subnets                               = module.vpc.public_subnets
  security_groups                       = [module.security_groups.ecs_security_group_id]
  assign_public_ip                      = var.assign_public_ip
  target_group_arn                      = module.load_balancer.target_group_arn
  container_name                        = var.container_name
  container_port                        = var.container_port
  dependency_arns                       = [module.load_balancer.alb_arn]
}

module "route53" {
  source          = "./modules/route53"
  domain_name     = var.domain_name
  subdomain       = var.subdomain
  alb_dns_name    = module.load_balancer.alb_dns_name
  alb_zone_id     = module.load_balancer.alb_zone_id
  hosted_zone_id  = var.hosted_zone_id
}

module "backend" {
  source         = "./modules/backend"
  bucket_name    = var.backend_bucket_name
  key            = var.backend_key
  region         = var.backend_region
  encrypt        = var.backend_encrypt
  dynamodb_table = var.backend_dynamodb_table
}

