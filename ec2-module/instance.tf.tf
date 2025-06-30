module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.0.0"
  
    name = "single-instance"

  instance_type = "t2.micro"
  vpc_security_group_ids = 
  subnet_id     = 

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}