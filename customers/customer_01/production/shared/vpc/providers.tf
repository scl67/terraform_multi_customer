provider "aws" {
  region  = "eu-west-1"
  alias   = "main"
  profile = var.profile
  default_tags {
    tags = {
      provisioner  = "terraform"
      account      = "production"
      environment  = "prod"
      organisation = "customer1"
    }
  }

}

provider "aws" {
  region  = "eu-west-2"
  alias   = "dr"
  profile = var.profile
  default_tags {
    tags = {
      provisioner  = "terraform"
      account      = "production"
      environment  = "prod"
      organisation = "customer1"
    }
  }
}
