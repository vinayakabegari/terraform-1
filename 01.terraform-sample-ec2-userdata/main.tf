provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-068257025f72f470d"
  instance_type          = "t2.micro"
  key_name               = "tf"
  monitoring             = true
  vpc_security_group_ids = ["sg-0dc1c9f6fcfb14769"]
  subnet_id              = "subnet-01b8c78bcb4752487"

  
  tags = {
    Name = "terraform-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}

terraform {
  backend "s3" {
    encrypt = true
    bucket = "srimanoutput"
    region = "ap-south-1"
    key = "terraform-state/terraform.tfstate"
  }
}
