variable "profile" {
  description = "AWS Profile"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "username" {
  description = "Database username"
  type        = string
}

variable "password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
}

variable "storage" {
  description = "Storage size in GB"
  type        = number
  default     = 50
}

variable "sg_name_prefix" {
  description = "Prefix for the prod security group name"
  type        = string
  default     = "prod-rds-sg"
}

variable "sg_name_description" {
  description = "Description of the prod security group"
  type        = string
  default     = "Security group for the prod database"
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "sg_tags" {
  description = "Tags to apply to the prod security group"
  type        = map(string)
  default     = {}
}

variable "db_tags" {
  description = "Tags to apply to the prod RDS instance"
  type        = map(string)
  default     = {}
}
