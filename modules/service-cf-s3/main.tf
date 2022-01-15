/**
 * # CloudFormation with S3 Origin
 *
 * [Example](../../examples/service-cf-s3)
 *
 */

resource "aws_cloudfront_distribution" "this" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = local.service_name
  default_root_object = "index.html"
  aliases             = var.domains
  price_class         = "PriceClass_200"

  viewer_certificate {
    cloudfront_default_certificate = var.ssl_certificate_arn == null
    acm_certificate_arn            = var.ssl_certificate_arn != null ? var.ssl_certificate_arn : null
    ssl_support_method             = var.ssl_certificate_arn != null ? "sni-only" : null
  }

  logging_config {
    include_cookies = false
    bucket          = data.aws_s3_bucket.logs.bucket_domain_name
    prefix          = "cloudfront/${local.service_name}"
  }

  origin {
    domain_name = aws_s3_bucket.this.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.this.bucket_regional_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.this.bucket_regional_domain_name

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name        = local.service_name
    environment = var.environment
    product     = var.product
    service     = var.service
  }
}

resource "aws_cloudfront_origin_access_identity" "this" {
  comment = local.service_name
}

data "aws_s3_bucket" "logs" {
  bucket = var.s3_bucket_logs
}
