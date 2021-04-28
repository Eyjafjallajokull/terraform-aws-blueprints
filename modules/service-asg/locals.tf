locals {
  prefix = "${var.product}-${var.service}-${var.environment}"
  user_data_params = {
    prefix               = local.prefix
    product              = var.product
    service              = var.service
    environment          = var.environment
    additional_user_data = var.additional_user_data
  }
}

