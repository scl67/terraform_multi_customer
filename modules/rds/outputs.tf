output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.db.endpoint
}

output "rds_arn" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.db.arn
}
