output "this_iam_role_arn" {
  description = "ARN of IAM role attached to EC2 instances"
  value       = aws_iam_role.this.arn
}

output "this_security_group_id" {
  description = "ID of Security Group attached to EC2 instances"
  value       = aws_security_group.this.id
}

output "this_asg_name" {
  description = "AutoScaling Group Name"
  value       = aws_autoscaling_group.this.name
}
