data "aws_vpc" "main_vpc" {
  provider = aws.main
  tags = {
    Name = "customer1-dev-vpc"
  }
}

data "aws_subnets" "main_subnets" {
  provider = aws.main
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main_vpc.id]
  }
  filter {
    name   = "tag:environment"
    values = ["int"]
  }
}

data "aws_vpc" "dr_vpc" {
  provider = aws.dr
  tags = {
    Name = "customer1-dev-vpc"
  }
}

data "aws_subnets" "dr_subnets" {
  provider = aws.dr
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.dr_vpc.id]
  }
  filter {
    name   = "tag:environment"
    values = ["int"]
  }
}
