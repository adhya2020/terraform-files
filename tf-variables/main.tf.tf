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
  owner = "ABC"
  name = "MySERVER"
}

resource "aws_instance" "myserver" {
    ami = "ami-0b09627181c8d5778"
    instance_type = var.aws_instance_type



root_block_device {
    delete_on_termination = true
    volume_size = var.ec2_config.v_size
    volume_type = var.ec2_config.v_type
}

   tags = {
       Name = local.name
   }
}


