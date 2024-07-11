terraform {
  required_providers {
    azurerm ={
        version = "~>3.18"
    }
    random ={
        source = "hashicorp/random"
        version = "3.5.1"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "random_string" "random" {
  length = 4
  special = false //what is special
  upper = false
}

resource "azurerm_resource_group" "rg" {
    name = "RG-${var.resource_group_name}-${var.environment}"
    location = var.location
    tags = {
      "ENV" = var.environment
    }

}



resource "azurerm_service_plan" "plan" {
    name = var.service_plan_name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location

    os_type =  "Linux"
    sku_name = "B1"
    tags = {
      ENV = var.environment
      createdby = var.createdby
    }
}

resource "azurerm_linux_web_app" "app" {
    name = "${var.app_name}-${var.environment}-${random_string.random.result}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.plan.id

   
    site_config {
      
    }

    app_settings = {
        api_key = var.api_key
    }
  
}

resource "azurerm_application_insights" "appinsight-app" {
    name = "${var.app_name}-${var.environment}-${random_string.random.result}"
    location = azurerm_resource_group.rg.location
    application_type = "web"
    resource_group_name = azurerm_resource_group.rg.name
    tags = {
      ENV = var.environment
      createdby = var.createdby
    }
  
}

output "webapp_hostname" {
    description = "Hostname of the webapp"
    value = azurerm_linux_web_app.app.default_hostname
  
}

output "webapp_password" {
    description = "temp password"
    value = azurerm_linux_web_app.app.site_credential
    sensitive = true
}
