terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "intro" {
    ami = "ami-0dee22c13ea7a9a67"
    instance_type= "t2.micro"
    availability_zone = "ap-south-1a"
    key_name = "Sunloid-test"
    // All traffic are allowed
    vpc_security_group_ids = ["sg-0e021e9d85bb8b30c"]
    tags = {
        Name = "Terraform-Exercise"
        Project = "Yes"
    }
}
