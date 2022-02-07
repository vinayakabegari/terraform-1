provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-0e472ba40eb589f49"
  instance_type          = "t2.micro"
  key_name               = "route53"
  monitoring             = true
  vpc_security_group_ids = ["sg-067fe1167fada2983"]
  subnet_id              = "subnet-0ae6d148a8430e69e"
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

