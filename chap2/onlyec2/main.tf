provider aws{
  region="us-west-2"
}

resource aws_instance "example"{
  ami="ami-0571c1aedb4b8c5fc"
  instance_type = "t2.micro"

}