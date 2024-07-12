terraform {
    required_version = "~>1.2"
  required_providers {
    azurerm={
        required_version="~>3.23"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rg" {
    name = "${var.resource_group_name}-${var.environment}"
    location = var.location
     
}

data "azurerm_service_plan" "myplan"{
    name = "app-service-plan"
    resource_group_name = "rg-service-plan"
}

resource "azurerm_linux_web_app" "app" {
    name = var.app_name
    site_config {
      
    }
    service_plan_id = data.azurerm_service_plan.myplan.id
    location = azurerm_resource_group.rg.location
    resource_group_name = resource_group_name.name  
}

resource "azurerm_application_insights" "name" {
  name =  "${var.app_name}-${var.environment}"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.name
  application_type = "web"
  tags = var.tags
}