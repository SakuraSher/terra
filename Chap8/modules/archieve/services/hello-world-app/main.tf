terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


module "asg"{

  source = "../../../modules/asg/cluster"
  cluster_name =" "
  ami= var.ami
  instance_type = "t2.micro"
  user_data = templatefile("${path.module}/user-data.sh",{
   server_port = var.server_port
   db_address = data.terraform.terraform_remote_state.db.outputs.address
   db_port = data.terraform.terraform_remote_state.db.outputs.port
  })
  
  min_size =var.min_size
  max_size = var.max_size
  enable_autoscaling = var.enable_autoscaling
  subnet_ids = data.aws_subnets.default.ids
  target_group_arns =[aws_lb_target_group.asg.arns]
  health_check_type ="ELB"
  custom_tags = var.custom_tags
}



resource "aws_lb_target_group" "asg" {
  name     = var.cluster_name
  port     = var.server_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "asg" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg.arn
  }
}

resource "aws_security_group" "alb" {
  name = "${var.cluster_name}-alb"
}



data "terraform_remote_state" "db" {
  backend = "s3"

  config = {
    bucket = var.db_remote_state_bucket
    key    = var.db_remote_state_key
    region = "us-east-2"
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

locals {
  http_port    = 80
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}