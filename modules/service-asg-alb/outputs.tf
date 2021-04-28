output "asg_iam_role_arn" {
  value       = module.asg.this_iam_role_arn
  description = "ARN of IAM role attached to EC2 instances"
}

output "asg_security_group_id" {
  value       = module.asg.this_security_group_id
  description = "ID of Security Group attached to EC2 instances"
}

output "alb_security_group_id" {
  value       = aws_security_group.this.id
  description = "ID of Security Group attached to ALB"
}

output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "alb_zone_id" {
  value = aws_lb.this.zone_id
}

