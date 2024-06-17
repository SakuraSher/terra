 terraform {
 required_version = ">= 0.13"

  required_providers {
 azurerm = {
      source = "hashicorp/azurerm"
 }
  }
 }



 provider "azurerm" {
    skip_provider_registration = true
    features {
      
    }
   
 }
variable "resource_group_name" {
  default = "rg_test"
}

variable "location" {
  default = "Southeast Asia"
  validation {
    condition = can(index(["Southeast Asia"],var.location)>=0)
    error_message = "The location is right"
  }
  
}
resource "azurerm_resource_group" "rg"{
    name = var.resource_group_name
    location = var.location
    }

 resource "azurerm_public_ip" "pip" {
    name  = "bookip"
    location =  "Southeast Asia"
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method = "Dynamic"

}

