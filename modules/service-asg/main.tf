/**
 * # AutoScaling Group
 *
 * Provide AutoScaling Group. This module does not define any webservice
 * ingress so is suitable for background processing.
 *
 * [../../examples/service-asg](Example)
 * 
 */

resource "aws_autoscaling_group" "this" {
  desired_capacity          = var.desired_capacity
  enabled_metrics           = ["GroupTotalInstances", "GroupInServiceInstances"]
  health_check_grace_period = 60
  health_check_type         = var.health_check_type
  max_size                  = var.max_size
  min_size                  = var.min_size
  name                      = local.prefix
  protect_from_scale_in     = false
  suspended_processes       = ["AZRebalance"]
  termination_policies      = ["OldestLaunchTemplate", "OldestInstance"]
  vpc_zone_identifier       = var.vpc_subnet_ids

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  lifecycle {
    ignore_changes = [desired_capacity, max_size, load_balancers, target_group_arns]
  }

  tag {
    key                 = "Name"
    value               = local.prefix
    propagate_at_launch = true
  }

  tag {
    key                 = "product"
    value               = var.product
    propagate_at_launch = true
  }

  tag {
    key                 = "service"
    value               = var.service
    propagate_at_launch = true
  }

  tag {
    key                 = "environment"
    value               = var.environment
    propagate_at_launch = true
  }
}

resource "aws_launch_template" "this" {
  #ebs_optimized                        = true
  image_id                             = var.image_id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.instance_type
  key_name                             = var.key_name
  name                                 = local.prefix
  user_data                            = base64encode(templatefile("${path.module}/templates/user_data.sh", local.user_data_params))

  monitoring {
    enabled = false
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.this.name
  }

  network_interfaces {
    subnet_id       = var.vpc_subnet_ids[0]
    security_groups = [aws_security_group.this.id]
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      encrypted   = true
      kms_key_id  = data.aws_kms_key.ebs.arn
      volume_size = var.root_volume_size
      volume_type = "gp3"
    }
  }

  tag_specifications {
    resource_type = "volume"

    tags = {
      Name        = local.prefix
      environment = var.environment
      product     = var.product
      service     = var.service
    }
  }

  tags = {
    environment = var.environment
    product     = var.product
    service     = var.service
  }

}

resource "aws_security_group" "this" {
  name        = local.prefix
  description = "Allow traffic for ${local.prefix} EC2 instance"
  vpc_id      = var.vpc_id

  tags = {
    Name        = local.prefix
    environment = var.environment
    product     = var.product
    service     = var.service
  }
}

resource "aws_security_group_rule" "egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all egress traffic"
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.this.id
  to_port           = 0
  type              = "egress"
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

