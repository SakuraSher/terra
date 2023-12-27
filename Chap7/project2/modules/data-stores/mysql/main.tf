provider "aws"{
  region = "ap-south-1"

}

resource "aws_db_instance" "example"{
  allocated_storage = 10
  db_name = "runAmu"
  engine = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true

}