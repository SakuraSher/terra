terraform {
  required_providers {
    azurerm ={
        version = "~>3.20"
    }
  }
}

locals {
  network = yamldecode(file("network.yaml"))
}

resource "azurerm_resource_group" "rg" {
  name =  "rgyamldemo"
  location = "westeurope"
}

resource "azurerm_virtual_network" "avn" {
    name = local.network.name
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space = [local.network,address_space]
    

  
}