resource "aws_ecs_cluster" "this" {
  name = "${var.name}-ecs-cluster"
  tags = merge(var.tags, { Name = "${var.name}-ecs-cluster" })
} 