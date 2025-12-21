# resource "aws_eks_access_entry" "node" {
#   cluster_name  = aws_eks_cluster.this.name
#   principal_arn = var.node_role_arn
#   type          = "EC2_LINUX"
# }