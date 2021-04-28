resource "aws_dlm_lifecycle_policy" "this" {
  description        = "Daily EBS backups"
  execution_role_arn = aws_iam_role.dlm.arn
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule {
      name = "2 weeks of daily snapshots"

      create_rule {
        interval      = 24
        interval_unit = "HOURS"
        times         = ["23:30"]
      }

      retain_rule {
        count = 7
      }

      tags_to_add = {
      }

      copy_tags = true
    }

    target_tags = {
      Name = local.prefix
    }
  }

  tags = {
    Name        = local.prefix
    environment = var.environment
    product     = var.product
    service     = var.service
  }
}

