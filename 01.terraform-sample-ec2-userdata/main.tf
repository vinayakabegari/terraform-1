provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-062df10d14676e201"
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-0f4280f8a1b1411c7"]
  subnet_id              = "subnet-0bf448f24f9309d84"

  
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
