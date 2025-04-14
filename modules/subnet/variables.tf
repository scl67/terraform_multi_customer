variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name              = string
    cidr_block        = string
    environment       = string
    availability_zone = string
  }))
}

variable "tags" {
  type        = map(string)
  description = "VPC tags"
}
