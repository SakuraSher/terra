provider "aws"{
  region = "ap-south-1"

}

module "asg"{
  source = "../../modules/cluster/asg"
  
}