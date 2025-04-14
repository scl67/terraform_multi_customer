module "rds" {
  source              = "../../../../modules/rds"
  vpc_id              = data.aws_vpc.main_vpc.id
  subnet_ids          = data.aws_subnets.main_subnets.ids
  db_name             = var.db_name
  username            = var.username
  password            = var.password
  instance_class      = var.instance_class
  engine              = var.engine
  engine_version      = var.engine_version
  storage             = var.storage
  sg_name_prefix      = var.sg_name_prefix
  sg_name_description = var.sg_name_description
  sg_tags             = var.sg_tags
  db_tags             = var.db_tags
  ingress_rules       = var.ingress_rules
}
