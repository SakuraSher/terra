/*
 terraform{
   required_providers{
     <LOCAL_NAME> = {
	   source = "<URL>"
	   version = "<version>"
	 }
   }
 }
 LOCAL_NAME is uesed to diambiguate two providers that have the same name
 
 */

provider "aws" {
  region = "ap-south-1"
  alias  = "region_1"

}

provider "aws" {
  region = "us-east-2"
  alias  = "region_2"

}

resource "aws_instance" "exone" {
  provider      = aws.region_1
  ami           = data.aws_ami.region1.id
  instance_type = "t2.small"
  
}

resource "aws_instance" "extwo" {
  provider      = aws.region_2
  ami           = data.aws_ami.region2.id
  instance_type = "t2.small"

}
data "aws_region" "region_1"{
  provider = aws.region_1
}

data "aws_ami" "region1" {

  provider = aws.region_1
  owners      = ["amazon"] #canonical
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*"]
  }
  
  
}

data "aws_ami" "region2" {

  provider = aws.region_2
  owners      = ["amazon"] #canonical
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*"]
  }

  

}

