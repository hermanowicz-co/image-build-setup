module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = "build-vpc"
  cidr = "10.0.0.0/16"

  azs            = ["${var.region}a", "${var.region}b", "${var.region}c"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Opentofu    = "true"
    Environment = "build"
  }
}
