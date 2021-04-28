<!-- BEGIN_TF_DOCS -->
# Service Single Instance

Purpose of this module is to provide easy way to start any service using
single EC2 instance with Elastic IP.

[../../examples/service-single-instance](Example)

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
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_dlm_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dlm_lifecycle_policy) | resource |
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.dlm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.dlm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudwatch_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.dlm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_user_data"></a> [additional\_user\_data](#input\_additional\_user\_data) | User Data script that will be appended to default script | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | EC2 instance AMI image ID | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | EC2 instance SSH key pair name | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Product name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | Service name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | EC2 instance volume size | `number` | `10` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |
| <a name="input_vpc_subnet_id"></a> [vpc\_subnet\_id](#input\_vpc\_subnet\_id) | VPC Subnet ID that instnace will be attached to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this_iam_role_arn"></a> [this\_iam\_role\_arn](#output\_this\_iam\_role\_arn) | ARN of IAM role attached to EC2 instance |
| <a name="output_this_public_ip"></a> [this\_public\_ip](#output\_this\_public\_ip) | Public IP of EC2 instance |
| <a name="output_this_security_group_id"></a> [this\_security\_group\_id](#output\_this\_security\_group\_id) | ID of Security Group attached to EC2 instance |
<!-- END_TF_DOCS -->