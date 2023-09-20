provider "aws" {
	region="us-west-2"
}


resource "aws_instance" "example"{
ami = "ami-0ccea833bf267252a"
instance_type = "t2.micro"
tags ={
	Name="terraform-example"
	}
}