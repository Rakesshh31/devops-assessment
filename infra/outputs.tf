output "vpc_id" {
  description = "The ID of the created VPC."
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of created public subnets."
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of created private subnets."
  value       = module.network.private_subnet_ids
}

output "rds_endpoint" {
  description = "The RDS database endpoint address."
  value       = module.rds.db_endpoint
}

output "ecs_cluster_name" {
  description = "The name of the ECS cluster."
  value       = module.ecs.cluster_name
}

output "application_url" {
  description = "Public URL of the ECS application load balancer."
  value       = module.ecs.load_balancer_dns_name
}
