<!-- BEGIN_TF_DOCS -->
# AutoScaling Group

Provide AutoScaling Group. This module does not define any webservice
ingress so is suitable for background processing.

[../../examples/service-asg](Example)

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
| [aws_autoscaling_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudwatch_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_kms_key.ebs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_user_data"></a> [additional\_user\_data](#input\_additional\_user\_data) | User Data script that will be appended to default script | `string` | `""` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | Desired capacity of ASG | `number` | `2` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_health_check_type"></a> [health\_check\_type](#input\_health\_check\_type) | Health check type to use for AutoScaling group | `string` | `"EC2"` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | EC2 instance AMI ID | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | EC2 instance SSH key pair name | `any` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum size of ASG | `number` | `2` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum size of ASG | `number` | `1` | no |
| <a name="input_product"></a> [product](#input\_product) | Product name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | EC2 instance root volume size (GB) | `number` | `10` | no |
| <a name="input_service"></a> [service](#input\_service) | Service name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `any` | n/a | yes |
| <a name="input_vpc_subnet_ids"></a> [vpc\_subnet\_ids](#input\_vpc\_subnet\_ids) | VPC Subnet IDS | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this_asg_name"></a> [this\_asg\_name](#output\_this\_asg\_name) | AutoScaling Group Name |
| <a name="output_this_iam_role_arn"></a> [this\_iam\_role\_arn](#output\_this\_iam\_role\_arn) | ARN of IAM role attached to EC2 instances |
| <a name="output_this_security_group_id"></a> [this\_security\_group\_id](#output\_this\_security\_group\_id) | ID of Security Group attached to EC2 instances |
<!-- END_TF_DOCS -->