resource "aws_eks_node_group" "this" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn  = aws_iam_role.node.arn
  subnet_ids     = var.subnet_ids

  # Explicit and configurable
  instance_types = var.instance_types
  capacity_type  = var.capacity_type
  disk_size      = var.disk_size

  # Pin to cluster version (upgrade-safe)
  version = var.cluster_version

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    nodegroup = var.node_group_name
    workload  = "system"
  }

  tags = {
    Name        = "${var.cluster_name}-${var.node_group_name}"
    Environment = var.environment
    ManagedBy   = "terraform"
  }

  depends_on = [
    aws_iam_role_policy_attachment.node
  ]
}