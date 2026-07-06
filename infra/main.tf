locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

module "network" {
  source               = "./modules/network"
  environment          = var.environment
  project_name         = var.project_name
  cidr_block           = var.cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  db_port              = var.db_engine == "mysql" ? 3306 : 5432
  tags                 = local.common_tags
}

module "rds" {
  source               = "./modules/rds"
  environment          = var.environment
  project_name         = var.project_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_allocated_storage = var.db_allocated_storage
  db_engine            = var.db_engine
  db_engine_version    = var.db_engine_version
  db_instance_class    = var.db_instance_class
  subnet_ids           = module.network.private_subnet_ids
  security_group_id    = module.network.rds_security_group_id
  tags                 = local.common_tags
}

module "ecs" {
  source                = "./modules/ecs"
  environment           = var.environment
  project_name          = var.project_name
  aws_region            = var.aws_region
  vpc_id                = module.network.vpc_id
  public_subnet_ids     = module.network.public_subnet_ids
  private_subnet_ids    = module.network.private_subnet_ids
  alb_security_group_id = module.network.alb_security_group_id
  ecs_security_group_id = module.network.ecs_security_group_id
  desired_count         = var.ecs_service_desired_count
  container_image       = var.ecs_container_image
  container_port        = var.ecs_container_port
  tags                  = local.common_tags
}
