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

data "aws_ami" "name" {
    most_recent = true
    owners = ["amazon"]
}

output "aws_ami" {
    value = data.aws_ami.name.id
}

# Security group

data "aws_security_group" "name" {
    tags = {
        env = "prod"
    }
  
}

output "security_group" {
    value = data.aws_security_group.name
}

# VPC id
data "aws_vpc" "name" {
    tags = {
        Name = "my-vpc"
    }
  
}

output "vpc_id" {
    value = data.aws_vpc.name.id
}

# Az
data "aws_availability_zones" "names" {
    state = "available"
  
}

output "aws_zones" {
    value = data.aws_availability_zones.names
  
}

# to get the account detail
data "aws_caller_identity" "name" {
  
}

output "caller_info" {
    value = data.aws_caller_identity.name
}

# Region
data "aws_region" "name" {
  
}

output "region-name" {
    value = data.aws_region.name
}

# Subnet id
data "aws_subnet" "name" {
    filter {
        name = "vpc-id"
        values = [data.aws_vpc.name.id]
    }
    tags = {
        Name = "private-subnet"
    }
  
}
  

resource "aws_instance" "myserver" {
    ami = "ami-0b09627181c8d5778"
    instance_type = "t3.nano"
    subnet_id = data.aws_subnet.name.id
    security_groups = [ data.aws_security_group.name.id ]

    tags = {
        Name = "sample-server"
    }
  
}