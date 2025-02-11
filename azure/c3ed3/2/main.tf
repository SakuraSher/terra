terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm ={
        version= "~> 3.18"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}



resource "azurerm_resource_group" "rg" {
    name = "RG-${local.resource_name}"
    location = "westeurope"
  
}

resource "azurerm_public_ip" "pp" {
    name = "IP-${local.resource_name}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method = "Dynamic"
    domain_name_label = "mydomain"
  
}

locals {
  resource_name = "${var.application_name}-${var.environment_name}"
}

