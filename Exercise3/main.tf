terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

resource "aws_key_pair" "name" {
  key_name = "Sunloid1"
  public_key = file("id_rsa.pub")
}

resource "aws_instance" "Instancefile" {
  ami = var.ami
  instance_type = "t2.micro"
  availability_zone = var.availability_zone
  key_name = "Sunloid1"
  vpc_security_group_ids = ["sg-0e021e9d85bb8b30c"]
  tags = {
    Name = "InstanceWebfile"
    Project = "YEs"
  }

  provisioner "file" {
    source = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" { 
    inline = [ 
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
     ]
  }

  connection {
    user = "ec2-user"
    private_key = file("id_rsa")
    host = self.public_ip
  }
}

output public_ip {
  value = aws_instance.Instancefile.public_ip
}

output private_ip { 
  value = aws_instance.Instancefile.private_ip
}
