# EC2 Instance Module

This module creates an EC2 instance on AWS.

## Inputs

| Name           | Description        | Type   |
|----------------|--------------------|--------|
| region         | AWS region         | string |
| ami            | AMI ID             | string |
| instance_type  | Instance type      | string |

## Outputs

| Name        | Description        |
|-------------|--------------------|
| instance_id | EC2 Instance ID    |
