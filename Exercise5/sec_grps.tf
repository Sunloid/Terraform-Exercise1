resource "aws_security_group" "TerraformSec" {
    vpc_id = aws_vpc.TerraformVPC.id
    name            = "terraform_sec"
    description     = "Security group for terraform based infrastructure"
    
    //Inbound traffic: Allows all traffic from tcp protocol 
    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
    }

    //Outbound traffic: Allows all traffic 
    egress {
        from_port   = 0
        to_port     = 0 
        protocol    = "-1"
        cidr_blocks = ["10.0.0.0/16"]
    }
    tags = {
      Name          = "TerraformSec"
    }
}