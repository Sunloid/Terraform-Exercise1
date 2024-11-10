resource "aws_vpc" "TerraformVPC" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "TerraformVPC"
  }
}

resource "aws_subnet" "TerraformSubnet1" {
  vpc_id = aws_vpc.TerraformVPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availability_zone1
  tags = {
    Name = "TerraformSubnet1"
  }
}

resource "aws_subnet" "TerraformSubnet2" {
  vpc_id = aws_vpc.TerraformVPC.id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.availability_zone2
  tags = {
    Name = "TerraformSubnet2"
  }
}

resource "aws_subnet" "TerraformSubnet3" {
  vpc_id = aws_vpc.TerraformVPC.id
  cidr_block = "10.0.3.0/24"
  availability_zone = var.availability_zone3
  tags = {
    Name = "TerraformSubnet3"
  }  
}
