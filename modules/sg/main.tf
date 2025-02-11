resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow all traffic"
  vpc_id      = var.vpc_id.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    to_port     = 22
    protocol    = "ssh"
    
  
}

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    
}
}