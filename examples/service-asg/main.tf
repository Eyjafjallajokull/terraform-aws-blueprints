module "core" {
  source = "../../modules/core"

  environment = "production"
  product     = "blueprints"

  vpc_enable_nat_gateway = false
}

module "service_asg" {
  source = "../../modules/service-asg"

  environment = "production"
  product     = "blueprints"
  service     = "ASG"

  key_name       = "devops"
  image_id       = "ami-0a49b025fffbbdac6"
  vpc_id         = module.core.vpc.vpc_id
  vpc_subnet_ids = module.core.vpc.public_subnets

  additional_user_data = <<EOF
#!/bin/bash
apt-get update
apt-get install -y nginx
EOF
}

resource "aws_security_group_rule" "http" {
  description       = "Allow ingress HTTP traffic"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.service_asg.this_security_group_id
}

