variable "rg_name" {
    description = "value"
}
variable "env" {
    default = "demo"
  
}
variable "location" {
  default = "SoutheastAsia"
  description = "value"
}

resource "azurerm_resource_group" "name" {
  name = var.rg_name
  location = var.location
  tags = {
    ENV = var.env
  }
}