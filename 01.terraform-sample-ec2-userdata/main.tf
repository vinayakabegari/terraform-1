provider "aws" {
  region = "us-west-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-009726b835c24a3aa"
  instance_type          = "t2.micro"
  key_name               = "test5"
  monitoring             = true
  vpc_security_group_ids = ["sg-03c75c0257dc82931"]
  subnet_id              = "subnet-0bd9d993f878cb57c"
    user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "terraform-example"
    Terraform   = "true"
    Environment = "dev"
  }
}

