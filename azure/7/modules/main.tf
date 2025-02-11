

resource "random_string" "random" {
  length = 4
  special = false
  upper = false
}

resource "azurerm_service_plan" "service-plan" {
  name = var.service_plan_name
  sku_name = "B1"
  location = var.location
  os_type = "Linux"
  resource_group_name = var.resource_group_name
}

resource "azurerm_linux_web_app" "app" {
  name = "${var.app_name}-${var.resource_group_name}-${random_string.random.result}"
  location = var.location
  resource_group_name = var.resource_group_name
  service_plan_id = azurerm_service_plan.service-plan.id
  site_config {
    
  }

}

resource "azurerm_application_insights" "appinsight" {
    name = var.app_name
    location = var.location
    resource_group_name = var.resource_group_name
    application_type = "web"
  
}


