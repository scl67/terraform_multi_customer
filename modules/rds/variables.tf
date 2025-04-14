variable "sg_name_prefix" {
  description = "The prefix for the security group name"
  type        = string
}

variable "sg_name_description" {
  description = "The description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
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
  validation {
    condition     = length(var.ingress_rules) > 0
    error_message = "At least one ingress rule must be provided"
  }
}

variable "sg_tags" {
  description = "Tags to apply to the security group"
  type        = map(string)
}

variable "storage" {
  description = "Gigabytes of storage"
  type        = number
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance class for the database"
  type        = string
}

variable "username" {
  description = "The master username for the database"
  type        = string
}

variable "password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance"
  type        = list(string)
}

variable "db_tags" {
  description = "Database tags"
  type        = map(string)
}
