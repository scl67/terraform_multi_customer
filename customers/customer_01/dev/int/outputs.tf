output "main_rds_endpoint" {
  description = "RDS instance endpoint for the main environment"
  value       = module.main_rds.rds_endpoint
}

output "main_rds_arn" {
  description = "RDS instance ARN for the main environment"
  value       = module.main_rds.rds_arn
}
