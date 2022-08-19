provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-052efd3df9dad4825"
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-07f6207a62c7b824f"]
  subnet_id              = "subnet-0ad73b4959132e442"

  
  tags = {
    Name = "terraform-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}

terraform {
  backend "s3" {
    encrypt = true
    bucket = "vkaoutput"
    region = "us-east-1"
    key = "terraform-state/terraform.tfstate"
  }
}
