variable "name" {}

variable "vpc_cidr" {}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "aws_region" {
  default = "ap-south-1"
}

variable "container_name" {}

variable "container_image" {}

variable "container_port" {
  default = 80
}

variable "container_environment" {
  default = []
}

variable "task_cpu" {
  default = "256"
}

variable "task_memory" {
  default = "512"
}

variable "desired_count" {
  default = 2
}

variable "tags" {
  type = map(string)
  default = {}
}