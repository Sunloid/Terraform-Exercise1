terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

resource "aws_key_pair" "Key_aws" {
  key_name = "Sunloid2"
  public_key = file("id_rsa.pub")
}

resource "aws_instance" "InstanceBucket" {
  ami = var.ami
  availability_zone = var.availability_zone
  instance_type = "t2.micro"
  key_name = "Sunloid2"
  vpc_security_group_ids = ["sg-0e021e9d85bb8b30c"]
  tags = {
    Name = "Instance_Bucket"
    Project = "YEs"
  }

  provisioner "file" {
    source = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh" 
    ]
  }

  connection {
    user = "ec2-user"
    type = "ssh"
    private_key = file("id_rsa")
    host = self.public_ip
  }
}