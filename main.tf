terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA3234FL2SWIJ2T35E"
  secret_key = "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"
}
resource "aws_instance" "web" {
  count= 3
  ami = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  subnet_id = "${element(aws_subnet.publicsubnets.*.id,count.index)}"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  tags = {
    Name = "server-${count.index+1}"
  }
}

##security groups

resource "aws_security_group" "sg" {
  name        = "sgs"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "pgs sg"
  }
}