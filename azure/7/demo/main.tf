terraform {
  required_version = "~>1.1"
  required_providers {
    azurerm ={
        version = "~>3.23"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "name" {
  name = "RG_MyApp_Demo"
  location = "West Europe"
}

module "webapp" {
  source = "../modules"
  app_name = "amumyapp"
  service_plan_name = "amuserviceplan"
  resource_group_name = azurerm_resource_group.name.name
}

output "webappusrl" {
  value = module.webapp.webapp_url
}