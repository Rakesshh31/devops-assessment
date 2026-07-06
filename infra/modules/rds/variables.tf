variable "project_name" {
  description = "Project name for naming and tagging." 
  type        = string
}

variable "environment" {
  description = "Deployment environment." 
  type        = string
}

variable "db_username" {
  description = "Database master username." 
  type        = string
}

variable "db_password" {
  description = "Database master password." 
  type        = string
  sensitive   = true
}

variable "db_allocated_storage" {
  description = "Allocated storage for the RDS instance." 
  type        = number
}

variable "db_engine" {
  description = "Database engine for the RDS instance." 
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version." 
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for RDS." 
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for the RDS subnet group." 
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID that allows database traffic." 
  type        = string
}

variable "tags" {
  description = "Common tags to apply to RDS resources." 
  type        = map(string)
  default     = {}
}
