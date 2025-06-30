terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "myserver" {
    ami = "ami-0b09627181c8d5778"
    instance_type = "t3.nano"

    tags = {
        Name = "sample-server"
    }
  
}