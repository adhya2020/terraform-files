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

# Create VPC

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
     tags = {
        Name = "my_vpc"
     }
  
}

# Private Subnet

resource "aws_subnet" "private-subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.my_vpc.id
     tags = {
        Name = "private-subnet"
     }
  
}

# Public Subnet

resource "aws_subnet" "public-subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.my_vpc.id
     tags = {
        Name = "public-subnet"
     }
  
}


# Internet Gateway

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my_vpc.id
      tags = {
         Name = "my-igw"
      }
  
}

# Route Table

resource "aws_route_table" "my-rt" {
    vpc_id = aws_vpc.my_vpc.id
      
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id
    }

    tags = {
      Name = "my-rt"
    }
  
}

# Route Table Association

resource "aws_route_table_association" "public-sub" {
    route_table_id = aws_route_table.my-rt.id
    subnet_id = aws_subnet.public-subnet.id
  
}

resource "aws_instance" "myserver" {
    ami = "ami-0b09627181c8d5778"
    instance_type = "t3.nano"
    subnet_id = aws_subnet.public-subnet.id

    tags = {
        Name = "sample-server"
    }
  
}