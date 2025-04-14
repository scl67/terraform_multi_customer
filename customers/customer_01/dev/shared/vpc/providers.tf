provider "aws" {
  region  = "eu-west-1"
  alias   = "main"
  profile = var.profile
  default_tags {
    tags = {
      region      = "eu-west-1"
      provisioner = "terraform"
      account     = "customer1"
    }
  }

}

provider "aws" {
  region  = "eu-west-2"
  alias   = "dr"
  profile = var.profile
  default_tags {
    tags = {
      region      = "eu-west-2"
      provisioner = "terraform"
      account     = "customer1"
    }
  }
}
