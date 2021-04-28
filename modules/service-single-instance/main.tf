/**
 * # Service Single Instance
 *
 * Purpose of this module is to provide easy way to start any service using
 * single EC2 instance with Elastic IP.
 *
 * [../../examples/service-single-instance](Example)
 *
 */

resource "aws_instance" "this" {
  ami                    = var.image_id
  iam_instance_profile   = aws_iam_instance_profile.this.name
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  subnet_id              = var.vpc_subnet_id
  user_data              = templatefile("${path.module}/templates/user_data.sh", local.user_data_params)
  vpc_security_group_ids = [aws_security_group.this.id]

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.volume_size
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name        = local.prefix
    environment = var.environment
    product     = var.product
    service     = var.service
  }

  volume_tags = {
    Name        = local.prefix
    environment = var.environment
    product     = var.product
    service     = var.service
  }
}

resource "aws_security_group" "this" {
  description = "Allow traffic for ${local.prefix} EC2 instance"
  name        = local.prefix
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

resource "aws_eip" "this" {
  instance = aws_instance.this.id
  vpc      = true
  tags = {
    Name        = local.prefix
    environment = var.environment
    product     = var.product
    service     = var.service
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name              = local.prefix
  retention_in_days = 30
  tags = {
    Name        = local.prefix
    environment = var.environment
    product     = var.product
    service     = var.service
  }
}
