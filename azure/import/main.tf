terraform {
  required_version = ">=0.12"
}

provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "rg" {
  name = "RG-IMPORT"
  location = "westeurope"
}