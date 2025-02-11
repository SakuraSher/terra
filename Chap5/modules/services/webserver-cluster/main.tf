terraform {
  required_version = ">=1.0.0,<2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"

    }

  }

}


resource "aws_launch_template" "example"{
  name_prefix = "example_sample"
  image_id = ""
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar"{
  availability_zones =""
  desired_capacity = ""
  max_size = 2
  min_size = 1
  
  launch_template {
    id = aws_launch_template.example.id
	version = "$Latest"
  }
}