terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_subnet" "subnet" {
  for_each          = { for subnet in var.subnets : subnet.name => subnet }
  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = merge(var.tags, {
    environment = "${each.value.environment}"
  })
}
