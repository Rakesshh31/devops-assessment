variable "project_name" {
  description = "Project name for naming and tagging." 
  type        = string
}

variable "environment" {
  description = "Deployment environment." 
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for ECS resources." 
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for the load balancer." 
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for ECS tasks." 
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID for the ALB." 
  type        = string
}

variable "ecs_security_group_id" {
  description = "Security group ID for ECS tasks." 
  type        = string
}

variable "container_image" {
  description = "Docker image for the ECS task." 
  type        = string
}

variable "container_port" {
  description = "Container port exposed by the ECS service." 
  type        = number
}

variable "desired_count" {
  description = "Desired number of ECS tasks." 
  type        = number
}

variable "aws_region" {
  description = "AWS region passed from the root module." 
  type        = string
}

variable "tags" {
  description = "Common tags to apply to ECS resources." 
  type        = map(string)
  default     = {}
}
