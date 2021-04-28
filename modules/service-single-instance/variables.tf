variable "environment" {
  description = "Environment name, used for naming and tagging"
  type        = string
}

variable "product" {
  description = "Product name, used for naming and tagging"
  type        = string
}

variable "service" {
  description = "Service name, used for naming and tagging"
  type        = string
}

variable "image_id" {
  description = "EC2 instance AMI image ID"
  type        = string
}

variable "instance_type" {
  default     = "t3.micro"
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 instance SSH key pair name"
  type        = string
}

variable "vpc_subnet_id" {
  description = "VPC Subnet ID that instnace will be attached to"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "additional_user_data" {
  default     = ""
  description = "User Data script that will be appended to default script"
  type        = string
}

variable "volume_size" {
  default     = 10
  description = "EC2 instance volume size"
  type        = number
}

