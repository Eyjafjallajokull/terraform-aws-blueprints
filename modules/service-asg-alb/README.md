<!-- BEGIN_TF_DOCS -->
# AutoScaling Group behind Application Load Balancer

Dedicated to hosting scalable webservices.

[Example](../../examples/service-asg-alb)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.66.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_asg"></a> [asg](#module\_asg) | ../service-asg | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.service_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.service_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.alb_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.alb_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.asg_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_user_data"></a> [additional\_user\_data](#input\_additional\_user\_data) | EC2 instance User Data script | `string` | `""` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | Desired capacity of ASG | `number` | `2` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | EC2 instance AMI ID | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | EC2 instance SSH key pair name | `string` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum size of ASG | `number` | `2` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum size of ASG | `number` | `1` | no |
| <a name="input_product"></a> [product](#input\_product) | Product name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | EC2 instance root volume size (GB) | `number` | `10` | no |
| <a name="input_s3_bucket_logs"></a> [s3\_bucket\_logs](#input\_s3\_bucket\_logs) | S3 bucket for storing ALB logs | `any` | `null` | no |
| <a name="input_service"></a> [service](#input\_service) | Service name, used for naming and tagging | `string` | n/a | yes |
| <a name="input_ssl_certificate_arn"></a> [ssl\_certificate\_arn](#input\_ssl\_certificate\_arn) | ARN of ACM certificate to attach to ALB HTTPS listener, if not provided HTTPS will not be enabled | `any` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |
| <a name="input_vpc_private_subnet_ids"></a> [vpc\_private\_subnet\_ids](#input\_vpc\_private\_subnet\_ids) | VPC Private Subnet IDS | `list(string)` | n/a | yes |
| <a name="input_vpc_public_subnet_ids"></a> [vpc\_public\_subnet\_ids](#input\_vpc\_public\_subnet\_ids) | VPC Public Subnet IDS | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | n/a |
| <a name="output_alb_security_group_id"></a> [alb\_security\_group\_id](#output\_alb\_security\_group\_id) | ID of Security Group attached to ALB |
| <a name="output_alb_zone_id"></a> [alb\_zone\_id](#output\_alb\_zone\_id) | n/a |
| <a name="output_asg_iam_role_arn"></a> [asg\_iam\_role\_arn](#output\_asg\_iam\_role\_arn) | ARN of IAM role attached to EC2 instances |
| <a name="output_asg_security_group_id"></a> [asg\_security\_group\_id](#output\_asg\_security\_group\_id) | ID of Security Group attached to EC2 instances |
<!-- END_TF_DOCS -->