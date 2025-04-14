variable "profile" {
  description = "AWS Profile"
  type        = string
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "main_subnets" {
  description = "Subnets for the main VPC"
  type = list(object({
    name              = string
    cidr_block        = string
    environment       = string
    availability_zone = string
  }))
  validation {
    condition     = length(var.main_subnets) == 3
    error_message = "3 main subnets must be provided."
  }
}

variable "dr_subnets" {
  description = "Subnets for the DR VPC"
  type = list(object({
    name              = string
    cidr_block        = string
    environment       = string
    availability_zone = string
  }))
  validation {
    condition     = length(var.dr_subnets) == 3
    error_message = "3 DR subnets must be provided."
  }
}

variable "vpc_tags" {
  type        = map(string)
  description = "VPC tags"
  default = {
    Name        = "customer1-prod-vpc"
    environment = "prod"
  }
}

variable "subnet_tags" {
  type        = map(string)
  description = "Subnet tags"
  default = {
    Name        = "customer1-prod-subnet"
    environment = "prod"
  }
}
