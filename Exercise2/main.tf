terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

resource "aws_instance" "Instance_vars" {
  ami = var.ami
  instance_type = "t2.micro"
  availability_zone = var.availability_zone
  key_name = var.key_name
  vpc_security_group_ids = ["sg-0e021e9d85bb8b30c"]
  tags = {
    Name = "VariablesInstances"
    Project = "Test"
  }
}
