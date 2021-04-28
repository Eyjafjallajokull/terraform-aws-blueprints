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
  description = "EC2 instance AMI ID"
}

variable "instance_type" {
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "key_name" {
  description = "EC2 instance SSH key pair name"
}

variable "root_volume_size" {
  description = "EC2 instance root volume size (GB)"
  default     = 10
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "vpc_subnet_ids" {
  description = "VPC Subnet IDS"
}

variable "min_size" {
  default     = 1
  description = "Minimum size of ASG"
}

variable "max_size" {
  default     = 2
  description = "Maximum size of ASG"
}

variable "desired_capacity" {
  default     = 2
  description = "Desired capacity of ASG"
}

variable "additional_user_data" {
  default     = ""
  description = "User Data script that will be appended to default script"
  type        = string
}

variable "health_check_type" {
  default     = "EC2"
  description = "Health check type to use for AutoScaling group"
  type        = string
}
