module "vpc" {
  source                       = "terraform-aws-modules/vpc/aws"
  azs                          = data.aws_availability_zones.available.names
  cidr                         = var.vpc_cidr
  create_database_subnet_group = var.vpc_create_database_subnet_group
  database_subnets             = var.vpc_database_subnets
  enable_dns_hostnames         = true
  enable_nat_gateway           = var.vpc_enable_nat_gateway
  name                         = "${var.product}-${var.environment}"
  private_subnets              = var.vpc_private_subnets
  public_subnets               = var.vpc_public_subnets
  single_nat_gateway           = var.vpc_single_nat_gateway
  version                      = "2.77.0"

  tags = {
    environment = var.environment
    product     = var.product
  }

  public_subnet_tags = {
    environment = var.environment
    product     = var.product
  }

  private_subnet_tags = {
    environment = var.environment
    product     = var.product
  }
}
