variable "application_name" {
  description = "applicationname"
  validation {
    condition = contains(["aamooli,aamoola"],var.application_name)
    error_message = "incorrect-application-name"
  }

}

variable "environment_name" {
    default = "DEV-Amu"
    description = "environment name"
  
}