module "main_vpc" {
  source = "../../../../../modules/vpc"
  providers = {
    aws = aws.main
  }
  cidr_block = var.cidr_block
  tags       = var.vpc_tags
}

module "dr_vpc" {
  source = "../../../../../modules/vpc"
  providers = {
    aws = aws.dr
  }
  cidr_block = var.cidr_block
  tags       = var.vpc_tags
}

module "main_subnet" {
  source = "../../../../../modules/subnet"
  providers = {
    aws = aws.main
  }
  vpc_id  = module.main_vpc.vpc_id
  subnets = var.main_subnets
  tags    = var.subnet_tags
}

module "dr_subnet" {
  source = "../../../../../modules/subnet"
  providers = {
    aws = aws.dr
  }
  vpc_id  = module.dr_vpc.vpc_id
  subnets = var.dr_subnets
  tags    = var.subnet_tags
}
