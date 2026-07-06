output "cluster_name" {
  description = "The ECS cluster name." 
  value       = aws_ecs_cluster.this.name
}

output "service_name" {
  description = "The ECS service name." 
  value       = aws_ecs_service.app.name
}

output "load_balancer_dns_name" {
  description = "The DNS name of the application load balancer." 
  value       = aws_lb.app.dns_name
}
