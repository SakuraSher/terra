variable "rg_name" {
  description = "value"
}

variable "location" {
  description = "value"
  default     = "SoutheastAsia"

}

resource "azurerm_resource_group" "name" {
  name     = "resource-group1"
  location = "SouteastAsia"
  tags = {
    ENV = "demo"
  }

}