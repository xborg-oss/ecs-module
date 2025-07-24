# Example: Using the ECS Terraform Module

This example demonstrates how to use the ECS Terraform module to deploy a simple NGINX service on AWS ECS Fargate.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS credentials configured (via environment variables, AWS CLI, or shared credentials file)
- Existing VPC with at least two subnets and a security group

## Usage
1. Replace the placeholder values in `main.tf` for `subnet_ids` and `security_group_ids` with your actual AWS subnet and security group IDs.
2. Initialize Terraform:
   ```
   terraform init
   ```
3. Review the plan:
   ```
   terraform plan
   ```
4. Apply the configuration:
   ```
   terraform apply
   ```

## Outputs
- `ecs_cluster_id`: The ID of the created ECS cluster
- `ecs_service_name`: The name of the ECS service

## Cleanup
To destroy the resources created by this example:
```
terraform destroy
``` 