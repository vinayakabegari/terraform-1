provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-062df10d14676e201"
  instance_type          = "t2.micro"
  key_name               = "tf-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-0b6901944a034880c"]
  subnet_id              = "subnet-06372aa8e3da64a15"

  
  tags = {
    Name = "terraform-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}

terraform {
  backend "s3" {
    encrypt = true
    bucket = "tf-ec2-codeoutput"
    region = "ap-south-1"
    key = "terraform-state/terraform.tfstate"
  }
}
