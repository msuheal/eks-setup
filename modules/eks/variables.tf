variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "node_role_arn" {
  description = "IAM role ARN used by EKS node groups"
  type        = string
}

variable "admin_principal_arn" {
  description = "IAM principal ARN for cluster admin access"
  type        = string
}