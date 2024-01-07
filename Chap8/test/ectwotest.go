package test

import(
  "github.com/gruntwork-io/terratest/modules/terraform"
  "testing"
)

func TestEctwo(t *testing.T){
  opts := &terraform.Options{
     TerraformDir :"../modules/cluster/webapp",
	 //Deploy the example
	
  }
   terraform.InitAndApply(t,opts)
   ec2Name := terraform.OutputRequired(t,opts,"instance_id")
}

