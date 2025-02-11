
provider "aws" {
  region = "ap-south-1"
  alias  = "primary"
}


provider "aws" {
  region = "us-east-2"
  alias  = "secondary"
}

module "mysql_primary" {
  source = "../../../../modules/data-stores/mysql"
  providers = {
    aws = aws.primary
  }


  db_name                 = "primary_db"
  username                = "" #add username
  password                = "" #add password
  backup_retention_period = 1

}

module "mysql_secondary" {
  source = "../../../../modules/data-stores/mysql"
  providers = {
    aws = aws.secondary
  }
  replicate_source_db = module.mysql_primary.arn


}