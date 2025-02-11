resource "aws_autoscaling_group" "asg" {
  name                 = "asg"
  max_size             = 1
  min_size             = 0
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.lc.name
  vpc_zone_identifier  = [aws_subnet.subnet.id]
  target_group_arns    = [aws_lb_target_group.tg.arn]
  #health_check_type    = "ELB"
  #health_check_grace_period = 300
  termination_policies = ["OldestInstance"]
  tag {
    key                 = "Name"
    value               = "asg"
    propagate_at_launch = true
  }
}

resource aws_launch_configuration "lc" {
    name          = "lc"
    image_id      = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.medium"
    security_groups = [aws_security_group.sg.id]
    key_name = "asg-key"
    user_data = file("userdata.sh")
  
}