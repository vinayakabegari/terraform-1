provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-04505e74c0741db8d"
  instance_type          = "t2.micro"
  key_name               = "vpectesting"
  monitoring             = true
  vpc_security_group_ids = ["sg-026e6de718633f70f"]
  subnet_id              = "subnet-0ac4be71aa723b6f6"
  
  tags = {
    Name = "terraform-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}
