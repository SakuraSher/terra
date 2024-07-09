terraform {
  required_version = ">=0.12"
}

provider "azurerm" {
  features {
    
  }
}

locals {
  common_app_settings= {
    "INSTRUMENTATIONKEY" = azurerm_application_insights.appinsigts-app.insturmentation_key
  }
}

resource "azurerm_resource_group" "rg-app" {
  name = "${var.resource_group_name}-${var.environment}"
  location = var.location
  tags = {
    ENV = var.environment
  }
}

resource "azurerm_app_service_plan" "plan-app" {
    name = "${var.service_plan_name}-${var.environment}"
    location = azurerm_resource_group.rg_app.location
    resource_group_name =  azurerm_resource_group.rg-app.name
    sku {
      tier = "Free"
      size = "D1"
    }

    tags ={
        ENV = var.environment
        Createdby = var.createdby
    }
}
  
resource "azurerm_app_service" "app" {
  name = "${var.app_name}-${var.environment}"
  location = azurerm_resource_group.rg_app.location
  resource_group_name = azurerm_resource_group.rg-app.name
  app_service_plan_id = azurerm_app_service_plan.plan-app.id
}

resource "azurerm_application_insights" "appinsigts-app" {
    name = "${var.app_name}-${var.environment}"
    location = azurerm_resource_group.rg-app.location
    resource_group_name = azurerm_resource_group.rg-app.name
    application_type = "web"
    tags = {
        ENV = var.environment
        Createdby = var.createdby
    }
  
}
