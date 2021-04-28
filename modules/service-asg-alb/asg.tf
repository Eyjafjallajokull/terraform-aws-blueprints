module "asg" {
  source = "../service-asg"

  desired_capacity     = var.desired_capacity
  environment          = var.environment
  health_check_type    = "ELB"
  image_id             = var.image_id
  key_name             = var.key_name
  max_size             = var.max_size
  min_size             = var.min_size
  product              = var.product
  root_volume_size     = var.root_volume_size
  service              = "${var.service}-asg"
  additional_user_data = var.additional_user_data
  vpc_id               = var.vpc_id
  vpc_subnet_ids       = var.vpc_private_subnet_ids
}

resource "aws_security_group_rule" "asg_http" {
  description       = "Allow ingress HTTP traffic"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.asg.this_security_group_id
}

