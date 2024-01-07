
variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instance"
  type        = string
  default     = " ami-0338fb621d6390368" # Replace with the desired AMI ID
}