variable "rg_name" {
  description = "Name of resource group"
}

variable "location" {
  description = "location"
  default     = "southeastasia"
}

resource "azurerm_resource_group" "rg_app" {
  name     = var.rg_name
  location = var.location
  tags = {
    ENV = "Demo"
  }
}