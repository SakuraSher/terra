# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}


variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}

variable "enable_autoscaling" {
  description = "If set to true, enable auto scaling"
  type        = bool
}

variable "subnet_ids" {
  description = "The subnet id to deploy to"
  type = list(string)
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "ami" {
  description = "The AMI to run in the cluster"
  type        = string
  default     = "ami-0fb653ca2d3203ac1"
}



variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default     = {}
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}



variable "target_group_arns" {
  description = "ELB target group in which to register Instances"
  type = list(string)
  default = []
}

variable "health_check_type" {
  description = "type of health check to perform must be elb or ec2"
  type = string
  default = "EC2"
}

variable "user_data"{
description = "script to run at launch"
  type = string
  default = null

}
