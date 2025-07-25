name                 = "demoapp"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
azs                  = ["ap-south-1a", "ap-south-1b"]
container_name       = "demoapp"
container_image      = "nginx:latest"
container_port       = 80
container_environment = [
  { name = "ENV", value = "production" }
]
task_cpu             = "512"
task_memory          = "1024"
desired_count        = 2
tags = {
  Environment = "demo"
  Project     = "ecs-module"
}