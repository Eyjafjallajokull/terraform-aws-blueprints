module "core" {
  source = "../../modules/core"

  environment = "production"
  product     = "blueprints"

  vpc_enable_nat_gateway = false
}

module "service_cf_s3" {
  source = "../../modules/service-cf-s3"

  environment = "production"
  product     = "blueprints"
  service     = "cfs3"

  # domains             = ["static.website.com"]
  # ssl_certificate_arn = "arn:aws:acm:us-east-1:111111111111:certificate/xxx
  s3_bucket_logs = module.core.s3_bucket_logs
}

resource "aws_s3_bucket_object" "object" {
  bucket  = module.service_cf_s3.s3_bucket_name
  key     = "index.html"
  content = "Hello world!"
}

output "cloudfront_dns_name" {
  value = module.service_cf_s3.cloudfront_dns_name
}

