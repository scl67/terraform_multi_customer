provider "aws" {
  region  = "eu-west-1"
  profile = var.profile
  default_tags {
    tags = {
      region      = "eu-west-1"
      provisioner = "terraform"
      account     = "dev"
      environment = "int"
      Owner       = "customer1"
    }
  }
}
