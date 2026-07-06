output "db_endpoint" {
  description = "The RDS instance endpoint address." 
  value       = aws_db_instance.this.address
}

output "db_port" {
  description = "The RDS instance endpoint port." 
  value       = aws_db_instance.this.port
}
