variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "EKS cluster version (must be <= control plane version)"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS managed node group"
  type        = string
  default     = "system-ng"
}

variable "subnet_ids" {
  description = "Private subnet IDs where worker nodes will be created"
  type        = list(string)
}

variable "instance_types" {
  description = "EC2 instance types for the node group"
  type        = list(string)
  default     = ["t3.small"]
}

variable "capacity_type" {
  description = "Capacity type for the node group"
  type        = string
  default     = "ON_DEMAND"
}

variable "disk_size" {
  description = "Root volume size in GiB for worker nodes"
  type        = number
  default     = 50
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 4
}

variable "environment" {
  description = "Environment name (dev / qa / prod)"
  type        = string
}