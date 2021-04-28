resource "aws_sns_topic" "alerts" {
  name = "${var.product}-${var.environment}-alerts"

  tags = {
    product     = var.product
    environment = var.environment
  }
}

resource "aws_sns_topic_subscription" "alerts_email" {
  count     = var.alerts_email == null ? 0 : 1
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alerts_email
}

