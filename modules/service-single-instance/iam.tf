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
    environment = var.environment
    product     = var.product
    service     = var.service
  }
}

resource "aws_iam_role_policy_attachment" "cloudwatch_agent" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role" "dlm" {
  name = "${local.prefix}-dlm"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "dlm.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    environment = var.environment
    product     = var.product
    service     = var.service
  }
}

resource "aws_iam_policy" "dlm" {
  name        = "${local.prefix}-dlm"
  description = "Allow Data Lifecycle Manager to maintain Snapshots of ${local.prefix} instance"

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateSnapshot",
            "ec2:CreateSnapshots",
            "ec2:DeleteSnapshot",
            "ec2:DescribeInstances",
            "ec2:DescribeVolumes",
            "ec2:DescribeSnapshots"
         ],
         "Resource": "*"
      },
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateTags"
         ],
         "Resource": "arn:aws:ec2:*::snapshot/*"
      }
   ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "dlm" {
  role       = aws_iam_role.dlm.id
  policy_arn = aws_iam_policy.dlm.arn
}

