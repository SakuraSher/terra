terraform {
  required_providers {
    azurerm ={
        source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
    skip_provider_registration = true
 features {
   
 }
}

resource "azurerm_resource_group" "newapp" {
  name = var.resource_group_name    
  location = var.location
  tags = {
    ENV = var.ENV
  }
}