variable "name" {
  description = "Base name for resources."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks."
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones."
  type        = list(string)
}

variable "container_name" {
  description = "Name of the container."
  type        = string
}

variable "container_image" {
  description = "Docker image for the container."
  type        = string
}

variable "container_port" {
  description = "Port the container listens on."
  type        = number
  default     = 80
}

variable "container_environment" {
  description = "Environment variables for the container."
  type        = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "task_cpu" {
  description = "CPU units for the task."
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "Memory (MB) for the task."
  type        = string
  default     = "512"
}

variable "desired_count" {
  description = "Number of desired ECS tasks."
  type        = number
  default     = 2
} 