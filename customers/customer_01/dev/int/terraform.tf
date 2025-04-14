terraform {
  backend "s3" {
    bucket               = "customer1-dev-state-storage"
    dynamodb_table       = "terraform-state"
    key                  = "terraform.tfstate"
    workspace_key_prefix = "workspaces"
    region               = "eu-west-1"
  }
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 4.0"
      configuration_aliases = [aws.main, aws.dr]
    }
  }
}
