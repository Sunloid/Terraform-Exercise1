terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

resource "aws_key_pair" "TerraformKey" {
  key_name = "TerraformKey"
  public_key = file("id_rsa.pub")
}

resource "aws_instance" "TerraformVPCsec" {
  ami = var.ami
  availability_zone = var.availability_zone1
  vpc_security_group_ids = [aws_security_group.TerraformSec.id]
  key_name = aws_key_pair.TerraformKey.id
  subnet_id = aws_subnet.TerraformSubnet1.id
  instance_type = "t2.micro"
  tags = {
    Name = "TerraformSecVPC"
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
    private_key = file("id_rsa")
    type = "ssh"
    host = self.public_ip
  }
}

