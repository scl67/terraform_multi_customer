variable "profile" {
  description = "AWS Profile"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "applicationdb"
}

variable "username" {
  description = "Database username"
  type        = string
  default     = "db_user"
}

variable "password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "17.2"

}

variable "storage" {
  description = "Storage size in GB"
  type        = number
  default     = 20
}


variable "sg_name_prefix" {
  description = "Prefix for the security group name"
  type        = string
  default     = "int-rds-sg"
}

variable "sg_name_description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group for int the database"
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
  default = [
    {
      description = "Ingress for DB"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = [
        "10.0.1.0/24" # Example CIDR block
      ]
    }
  ]
}

variable "sg_tags" {
  description = "Tags to apply to the security group"
  type        = map(string)
}

variable "db_tags" {
  description = "Tags to apply to the RDS instance"
  type        = map(string)
}
