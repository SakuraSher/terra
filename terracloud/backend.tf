terraform {
  backend "remote" {
    organization = "cancercare0452"

    workspaces {
      name = "devops-aws-myapp-dev"
    }
  }
}