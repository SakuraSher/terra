variable "username"{
  type = string
  default = null
}

variable "password"{
  type = string
  default = null
}

variable "db_name"{
  type = string
  default = null 
}
variable "backup_retention_period"{
  type = number
  default = null
}

variable "replicate_source_db"{
  type = string
  default = null
}