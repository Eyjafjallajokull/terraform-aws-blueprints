<!-- BEGIN_TF_DOCS -->
# CloudFormation with S3 Origin

[Example](../../examples/service-cf-s3)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.66.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domains"></a> [domains](#input\_domains) | List of domains to be used for CloudFront | `list(string)` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Product name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_s3_bucket_logs"></a> [s3\_bucket\_logs](#input\_s3\_bucket\_logs) | Name of the S3 bucket dedicated for storing CloudFront access logs | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | Service name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_ssl_certificate_arn"></a> [ssl\_certificate\_arn](#input\_ssl\_certificate\_arn) | ARN of a valid certificate in us-east-1 | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_dns_name"></a> [cloudfront\_dns\_name](#output\_cloudfront\_dns\_name) | n/a |
| <a name="output_cloudfront_zone_id"></a> [cloudfront\_zone\_id](#output\_cloudfront\_zone\_id) | n/a |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | n/a |
<!-- END_TF_DOCS -->