output "this_public_ip" {
  value       = aws_instance.this.public_ip
  description = "Public IP of EC2 instance"
}

output "this_iam_role_arn" {
  value       = aws_iam_role.this.arn
  description = "ARN of IAM role attached to EC2 instance"
}

output "this_security_group_id" {
  value       = aws_security_group.this.id
  description = "ID of Security Group attached to EC2 instance"
}

