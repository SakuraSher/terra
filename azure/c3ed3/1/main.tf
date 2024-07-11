terraform {
  required_version = ">0.13"
}
provider "azurerm" {
  features {
    
  }
}
variable "resource_group_name"{
    default = "rg_test"
}

resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = "westeurope"
}

resource "azurerm_public_ip" "pip" {
  name = "bookip"
  location = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Dynamic"
  domain_name_label = "bookdevops"
}