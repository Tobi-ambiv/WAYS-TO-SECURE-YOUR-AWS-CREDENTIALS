variable "access_key" {
type = string
description = "The AWS access key."
}
variable "secret_key" {
type = string
description = "The AWS secret key."
}
variable "region" {
type = string
description = "The AWS region."
default = "us-east-1"
}

variable "region_list" {
type = list(string)
description = "AWS availability zones."
default = ["us-east-1a", "us-east-1b"]
}

variable "region" {
description = "The AWS region."
default = "us-east-1"
}
variable "region_list" {
description = "AWS availability zones."
default = ["us-east-1a", "us-east-1b"]
}

variable "region" {
description = "The AWS region."
default = "us-east-1"
}

variable "ami" {
type = map(string)
default = {
us-east-1 = "ami-0d729a60"
us-west-1 = "ami-7c4b331c"
}
description = "The AMIs to use."
}
  ON MAIN.TF

provider "aws" {
access_key = var.access_key
secret_key = var.secret_key
region = var.region
}
resource "aws_instance" "base" {
ami = var.ami[var.region]
instance_type = "t2.micro"
}
resource "aws_eip" "base" {
instance = aws_instance.base.id
vpc = true
}

variable "ami" {
type = map(string)
default = {
us-east-1 = "ami-0d729a60"
us-west-1 = "ami-7c4b331c"
}
description = "The AMIs to use."
}
on terraform.tfvars
access_key = "abc123"
secret_key = "abc123"
ami = {
us-east-1 = "ami-0d729a60"
us-west-1 = "ami-7c4b331c"
}
security_group_ids = [
"sg-4f713c35",
"sg-4f713c35",
"sg-4f713c35"
]

creating a directory
cd ~/terraform
$ mkdir web
$ cd web
$ git init

Adding the state file and backup to .gitignore

echo "terraform.tfstate*" >> .gitignore
$ git add .gitignore
$ git commit -m "Adding .gitignore file"



