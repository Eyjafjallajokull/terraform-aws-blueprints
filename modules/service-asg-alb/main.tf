/**
 * # AutoScaling Group behind Application Load Balancer
 *
 * Dedicated to hosting scalable webservices.
 *
 * [../../examples/service-asg-alb](Example)
 *
 */

resource "aws_lb" "this" {
  internal           = false
  load_balancer_type = "application"
  name               = local.prefix
  security_groups    = [aws_security_group.this.id]
  subnets            = var.vpc_public_subnet_ids

  enable_deletion_protection = false

  dynamic "access_logs" {
    for_each = var.s3_bucket_logs != null ? [1] : []
    content {
      bucket  = var.s3_bucket_logs
      enabled = true
    }
  }

  tags = {
    product     = var.product
    environment = var.environment
    service     = var.service
  }
}

resource "aws_lb_listener" "service_https" {
  count             = var.ssl_certificate_arn != null ? 1 : 0
  load_balancer_arn = aws_lb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.ssl_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_listener" "service_http" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_security_group" "this" {
  name        = local.prefix
  description = "Allow access to ${local.prefix} ALB"
  vpc_id      = var.vpc_id

  tags = {
    Name        = local.prefix
    environment = var.environment
    product     = var.product
    service     = var.service
  }
}

resource "aws_security_group_rule" "egress" {
  description       = "Allow all egress traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "alb_http" {
  description       = "Allow ingress HTTP traffic"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "alb_https" {
  count             = var.ssl_certificate_arn != null ? 1 : 0
  description       = "Allow ingress HTTPS traffic"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

resource "aws_lb_target_group" "this" {
  name     = local.prefix
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags = {
    product     = var.product
    environment = var.environment
    service     = var.service
  }
}

resource "aws_autoscaling_attachment" "this" {
  autoscaling_group_name = module.asg.this_asg_name
  alb_target_group_arn   = aws_lb_target_group.this.arn
}

