variable "profile" {
  description = "AWS Profile"
  type        = string
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "main_subnets" {
  description = "Subnets for the main VPC"
  type = list(object({
    name              = string
    cidr_block        = string
    environment       = string
    availability_zone = string
  }))
}

variable "dr_subnets" {
  description = "Subnets for the DR VPC"
  type = list(object({
    name              = string
    cidr_block        = string
    environment       = string
    availability_zone = string
  }))
}

variable "vpc_tags" {
  type        = map(string)
  description = "VPC tags"
  default     = {}
}

variable "subnet_tags" {
  type        = map(string)
  description = "Subnet tags"
  default     = {}
}
