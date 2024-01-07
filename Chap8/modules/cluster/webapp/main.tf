
provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}