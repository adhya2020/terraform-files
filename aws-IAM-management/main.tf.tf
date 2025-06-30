terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

locals {
  user_data = yamldecode(file("./users.yaml")).users
}


output "output" {
    value = local.user_data[*].username
}

# creating users
resource "aws_iam_user" "users" {
    for_each = toset( local.user_data[*].username)
    name = each.value
}
  
# password creation
resource "aws_iam_user_login_profile" "profile" {
  for_each = aws_iam_user.users
  user = each.value.name
  password_length = 12


  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key,
    ]
  }
}

