variable "project_name" {
  description = "Project name for naming and tagging." 
  type        = string
}

variable "environment" {
  description = "Deployment environment." 
  type        = string
}

variable "cidr_block" {
  description = "Primary VPC CIDR block." 
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks." 
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks." 
  type        = list(string)
}

variable "db_port" {
  description = "Database port for RDS security group." 
  type        = number
  default     = 5432
}

variable "tags" {
  description = "Common tags to apply to all resources." 
  type        = map(string)
  default     = {}
}
