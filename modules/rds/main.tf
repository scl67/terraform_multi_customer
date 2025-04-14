terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_security_group" "db_security_group" {
  name_prefix = var.sg_name_prefix
  description = var.sg_name_description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      description      = "Allow all outbound traffic"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  tags = var.sg_tags
}

resource "aws_db_subnet_group" "subnet_group" {
  name        = "${var.db_name}-subnet-group"
  subnet_ids  = var.subnet_ids
  description = "Subnet group for RDS instance"
}

resource "aws_db_instance" "db" {
  allocated_storage      = var.storage
  db_name                = var.db_name
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  tags                   = var.db_tags
}
