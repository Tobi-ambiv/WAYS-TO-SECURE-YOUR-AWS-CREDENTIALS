# WAYS-TO-SECURE-YOUR-AWS-CREDENTIALS
These are ways you can secure your credentials and i have listed 5 ways, check it out and try it




ways to configure credentials
1. input your credentials on the main.tf(expose they key)

2. shared_credentials_file = "/c/users/tobi Oderinde/.aws/credentials"
    region = "us-east-1"
4. saved in a different file named variable.tf
    variable access_key {
    type = string
    default = "jhfyufyfygyug"
    description = "for aws account 1"
}

variable secret_key {
    type = string
    default = "yfyfyfiygiug"
    description = "for aws acc 1"
}

on your main.tf 

provider "aws" {
access_key=var.access_key
secret_key=var.secret_key
}


4. aws configure --profile terraform-user

then refer-- provider "aws" {
profile = "terraform-user"
region = "us-east-1"
}



5. on the cli   type    export AWS_ACCESS_KEY_ID="jkwdkbcjiecbjdibc"
			export AWS_SECRET_ACCESS_KEY="cjbdbbbbjbj"


terraform {
	required_providers {
		aws = {
		 source = "hashicorp/aws"
		version = "~> 3.5.0"
	}
    }
}


provider "aws" { 
    access_key ="${var.aws_access_key}" 
    secret_key ="${var.aws_secret_key}"
    region     = "${var.region}"


variables.tf

AWS
resource "aws_instance" "ec2-instance" {
  ami           = "ami-090fa75af13c156c2" 
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform-Ec2_Instance"
  }
}







resource "aws_instance" "ec2-instance" {
  ami           = "ami-090fa75af13c156c2" 
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform-Ec2_Instance"
  }
}
 bonus--creating security group onn aws

resource "aws_security_group" "TF_SG" {
  name        = "TF_Seecurity_group"
  description = "TF_Security_group_using_aws"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "TF_Seecurity_group"
  }
}
