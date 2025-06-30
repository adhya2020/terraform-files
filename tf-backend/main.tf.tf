terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }
  backend "s3" {
    bucket = "demo-bucket-9066613105-123"
    key = "backend.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "myserver" {
    ami = "ami-0b09627181c8d5778"
    instance_type = "t3.nano"

    tags = {
        Name = "sample-server"
    }
  
}
