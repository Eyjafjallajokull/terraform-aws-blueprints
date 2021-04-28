module "core" {
  source = "../../modules/core"

  environment = "production"
  product     = "blueprints"

  vpc_enable_nat_gateway = true
}

module "service_asg_alb" {
  source = "../../modules/service-asg-alb"

  environment = "production"
  product     = "blueprints"
  service     = "AsgAlb"

  key_name               = "devops"
  image_id               = "ami-0a49b025fffbbdac6"
  vpc_id                 = module.core.vpc.vpc_id
  vpc_public_subnet_ids  = module.core.vpc.public_subnets
  vpc_private_subnet_ids = module.core.vpc.private_subnets
  s3_bucket_logs         = module.core.s3_bucket_logs

  additional_user_data = <<EOF
#!/bin/bash
apt-get install -y nginx
EOF
}

output "alb_dns_name" {
  value = module.service_asg_alb.alb_dns_name
}
