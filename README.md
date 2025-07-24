# ECS Terraform Module

This module provisions a complete, production-ready AWS ECS (Elastic Container Service) environment with all required networking components, security, and best practices. It is structured for maintainability, with each major resource type in its own file.

## Features
- Creates a VPC with public and private subnets across multiple AZs
- Provisions Internet Gateway, NAT Gateways, and route tables
- Deploys an Application Load Balancer (ALB) with security groups
- ECS Cluster, Fargate task definition, and service
- IAM roles for ECS task execution
- All resources are tagged and configurable


## Usage Example
```hcl
module "ecs" {
  source              = "./ecs-module"
  name                = "myapp"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
  azs                 = ["us-east-1a", "us-east-1b"]
  container_name      = "myapp"
  container_image     = "nginx:latest"
  container_port      = 80
  container_environment = [
    { name = "ENV", value = "production" }
  ]
  task_cpu            = "512"
  task_memory         = "1024"
  desired_count       = 2
  tags = {
    Environment = "production"
    Project     = "ecs-module"
  }
}
```

## Input Variables
| Name                   | Description                                 | Type         | Default         | Required |
|------------------------|---------------------------------------------|--------------|-----------------|----------|
| name                   | Base name for resources                     | string       | n/a             | yes      |
| tags                   | Map of tags to assign to resources          | map(string)  | `{}`            | no       |
| vpc_cidr               | CIDR block for the VPC                      | string       | 10.0.0.0/16     | no       |
| public_subnet_cidrs    | List of public subnet CIDR blocks           | list(string) | n/a             | yes      |
| private_subnet_cidrs   | List of private subnet CIDR blocks          | list(string) | n/a             | yes      |
| azs                    | List of availability zones                  | list(string) | n/a             | yes      |
| container_name         | Name of the container                       | string       | n/a             | yes      |
| container_image        | Docker image for the container              | string       | n/a             | yes      |
| container_port         | Port the container listens on               | number       | 80              | no       |
| container_environment  | Environment variables for the container     | list(object) | `[]`            | no       |
| task_cpu               | CPU units for the task                      | string       | 256             | no       |
| task_memory            | Memory (MB) for the task                    | string       | 512             | no       |
| desired_count          | Number of desired ECS tasks                 | number       | 2               | no       |

## Outputs
| Name               | Description                                 |
|--------------------|---------------------------------------------|
| vpc_id             | The ID of the VPC                           |
| public_subnet_ids  | IDs of the public subnets                   |
| private_subnet_ids | IDs of the private subnets                  |
| alb_dns_name       | DNS name of the Application Load Balancer   |
| ecs_cluster_id     | The ID of the ECS cluster                   |
| ecs_service_name   | The name of the ECS service                 |

## Best Practices
- Use at least two AZs for high availability
- Place ECS tasks in private subnets for security
- Use the ALB for external access and health checks
- Tag all resources for cost allocation and management

## Requirements
- Terraform >= 1.0.0
- AWS provider >= 4.0
- IAM permissions to create VPC, ECS, ALB, and IAM resources

## Notes
- This module provisions resources that may incur AWS charges
- You can extend the module to support autoscaling, custom ALB listeners, or additional security rules as needed 