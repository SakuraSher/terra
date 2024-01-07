output "asg_name"{
  value  = aws_autoscaling_group.example.name
  description = "the name of the autoscaling group"
}


output "instance_security_group_id"{
  value  = aws_security_group.instance.id
  description = "the name of the autoscaling group"
}