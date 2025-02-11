terraform {
    required_version = "~>1.1"
  required_providers {
    azurerm ={
        version = "3.23"
    }
    random={
        source = "hashicorp/random"
        version = "3.5.1"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rg" {
    name = "LoopAppmodule"
    location = "westeurope"
  
}
locals {
  webappnames = ["webappamu1","webappamu2"]
}

resource "random_string" "randomstr" {
  length  = 5
  special = false
  upper   = false
}

module "app" {
    source = "../modules"
    for_each = toset(local.webappnames)
    app_name = "loopyloop-${random_string.randomstr.result}"
    service_plan_name = "loopappamu-${random_string.randomstr.result}"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
  
}

output "app_service_urls" {
    value = values(module.app)[*].webapp_url
  
}

