provider "aws"{
  regoion = "ap_south_1"
}

resource "aws_db_instance" "default"{
  allocated_storage = 10
  db_name  = "mydb"
  engine  = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  username = ""
  password = ""
  

}