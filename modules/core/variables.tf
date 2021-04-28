variable "environment" {
  description = "Environment name, used for naming and tagging"
  type        = string
}

variable "product" {
  description = "Product name, used for naming and tagging"
  type        = string
}

variable "vpc_cidr" {
  default = "10.2.0.0/16"
}

variable "vpc_private_subnets" {
  default = ["10.2.16.0/20", "10.2.32.0/19", "10.2.64.0/19"]
}

variable "vpc_public_subnets" {
  default = ["10.2.96.0/19", "10.2.128.0/19", "10.2.160.0/19"]
}

variable "vpc_database_subnets" {
  default = ["10.2.7.0/24", "10.2.8.0/24", "10.2.9.0/24"]
}

variable "vpc_create_database_subnet_group" {
  description = "Controls if database subnets creation should be done in EKS module as well as in RDS module"
  default     = true
}

variable "vpc_enable_nat_gateway" {
  default = true
}

variable "vpc_single_nat_gateway" {
  default = true
}

variable "vpc_security_groups_trusted_cidrs" {
  default = []
}

variable "alerts_email" {
  description = "Email to subscribe for SNS alerting topic"
  default     = null
}

