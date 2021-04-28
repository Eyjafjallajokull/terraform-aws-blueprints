resource "aws_iam_instance_profile" "this" {
  name = local.prefix
  role = aws_iam_role.this.name
}

resource "aws_iam_role" "this" {
  name = local.prefix
  path = "/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name        = local.prefix
    environment = var.environment
    product     = var.product
    service     = var.service
  }
}

resource "aws_iam_role_policy_attachment" "cloudwatch_agent" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

