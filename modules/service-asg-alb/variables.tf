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
  type        = string
}

variable "instance_type" {
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "key_name" {
  description = "EC2 instance SSH key pair name"
  type        = string
}

variable "root_volume_size" {
  description = "EC2 instance root volume size (GB)"
  default     = 10
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "vpc_private_subnet_ids" {
  description = "VPC Private Subnet IDS"
  type        = list(string)
}

variable "vpc_public_subnet_ids" {
  description = "VPC Public Subnet IDS"
  type        = list(string)
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
  description = "EC2 instance User Data script"
}

variable "s3_bucket_logs" {
  default     = null
  description = "S3 bucket for storing ALB logs"
}

variable "ssl_certificate_arn" {
  default     = null
  description = "ARN of ACM certificate to attach to ALB HTTPS listener, if not provided HTTPS will not be enabled"
}

