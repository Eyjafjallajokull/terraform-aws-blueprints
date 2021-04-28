<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.66.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 2.77.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ebs_encryption_by_default.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_encryption_by_default) | resource |
| [aws_s3_bucket.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_sns_topic.alerts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.alerts_email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alerts_email"></a> [alerts\_email](#input\_alerts\_email) | Email to subscribe for SNS alerting topic | `any` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Product name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | `"10.2.0.0/16"` | no |
| <a name="input_vpc_create_database_subnet_group"></a> [vpc\_create\_database\_subnet\_group](#input\_vpc\_create\_database\_subnet\_group) | Controls if database subnets creation should be done in EKS module as well as in RDS module | `bool` | `true` | no |
| <a name="input_vpc_database_subnets"></a> [vpc\_database\_subnets](#input\_vpc\_database\_subnets) | n/a | `list` | <pre>[<br>  "10.2.7.0/24",<br>  "10.2.8.0/24",<br>  "10.2.9.0/24"<br>]</pre> | no |
| <a name="input_vpc_enable_nat_gateway"></a> [vpc\_enable\_nat\_gateway](#input\_vpc\_enable\_nat\_gateway) | n/a | `bool` | `true` | no |
| <a name="input_vpc_private_subnets"></a> [vpc\_private\_subnets](#input\_vpc\_private\_subnets) | n/a | `list` | <pre>[<br>  "10.2.16.0/20",<br>  "10.2.32.0/19",<br>  "10.2.64.0/19"<br>]</pre> | no |
| <a name="input_vpc_public_subnets"></a> [vpc\_public\_subnets](#input\_vpc\_public\_subnets) | n/a | `list` | <pre>[<br>  "10.2.96.0/19",<br>  "10.2.128.0/19",<br>  "10.2.160.0/19"<br>]</pre> | no |
| <a name="input_vpc_security_groups_trusted_cidrs"></a> [vpc\_security\_groups\_trusted\_cidrs](#input\_vpc\_security\_groups\_trusted\_cidrs) | n/a | `list` | `[]` | no |
| <a name="input_vpc_single_nat_gateway"></a> [vpc\_single\_nat\_gateway](#input\_vpc\_single\_nat\_gateway) | n/a | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_logs"></a> [s3\_bucket\_logs](#output\_s3\_bucket\_logs) | Name of the S3 bucket dedicated to storing logs |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |
<!-- END_TF_DOCS -->