output "vpc" {
  value = {
    vpc_id          = module.vpc.vpc_id
    public_subnets  = module.vpc.public_subnets
    private_subnets = module.vpc.private_subnets
  }
}

output "s3_bucket_logs" {
  description = "Name of the S3 bucket dedicated to storing logs"
  value       = aws_s3_bucket.logs.bucket
}

