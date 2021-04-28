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

variable "domains" {
  description = "List of domains to be used for CloudFront"
  type        = list(string)
  default     = null
}

variable "ssl_certificate_arn" {
  description = "ARN of a valid certificate in us-east-1"
  type        = string
  default     = null
}

variable "s3_bucket_logs" {
  description = "Name of the S3 bucket dedicated for storing CloudFront access logs"
  type        = string
}

