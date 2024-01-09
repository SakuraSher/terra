provider "aws"{
  region = "ap-south-1"

}

module "asg"{
  source = "../../modules/cluster/asg"
  cluster_name = "yerobun"
  instance_type= "t2.micro"
  min_size=1
  max_size=2
  enable_autoscaling=true
  subnet_ids=
  ami=
  custom_tags=
  target_group_arns=
  health_check_type="EC2"
  user_data =""
}