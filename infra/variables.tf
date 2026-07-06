variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name used for tagging and resource names."
  type        = string
  default     = "devops-assessment"
}

variable "cidr_block" {
  description = "Primary VPC CIDR block."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets."
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "db_username" {
  description = "Database master username."
  type        = string
  default     = "appuser"
}

variable "db_password" {
  description = "Database master password."
  type        = string
  sensitive   = true
  default     = "ChangeMe123!"
}

variable "db_allocated_storage" {
  description = "Allocated storage size for the RDS instance in GiB."
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "Database engine type."
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "Database engine version."
  type        = string
  default     = "15.4"
}

variable "db_instance_class" {
  description = "Database instance class for RDS."
  type        = string
  default     = "db.t3.micro"
}

variable "ecs_service_desired_count" {
  description = "Number of ECS Fargate tasks to run."
  type        = number
  default     = 1
}

variable "ecs_container_image" {
  description = "Docker image used by the ECS Fargate task."
  type        = string
  default     = "nginx:latest"
}

variable "ecs_container_port" {
  description = "Container port exposed by the ECS task."
  type        = number
  default     = 80
}
