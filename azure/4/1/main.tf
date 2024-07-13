terraform {
    required_version = "~> 1.1"
  required_providers {
    
    azurerm ={
        version = "~>3.23"
    }

    random ={
        source = "hashicorp/random"
        version = "2.3.0"
    }
  }
  
}

provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group"  "rg-app" {
  name = "${var.resource_group_name}-${var.environment}"
  location = var.location
 # tags = var.tags
}

resource "random_string" "random" {
  length = 4
  special = false
  upper = true
}

resource "azurerm_service_plan" "app-plan" {
  resource_group_name = azurerm_resource_group.rg-app.name
  location = azurerm_resource_group.rg-app.location
  name = "${var.service_plan_name}-${var.environment}"
  os_type = "Linux"
  sku_name = "S1"
  
}
resource "azurerm_linux_web_app" "app" {
  name = "${var.app_name}-${var.environment}-${random_string.random.result}"
  site_config {
    
  }
  resource_group_name = azurerm_resource_group.rg-app.name
  location = azurerm_resource_group.rg-app.location
  service_plan_id = azurerm_service_plan.app-plan.id
}
