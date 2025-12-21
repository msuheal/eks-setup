variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project / cluster name"
  type        = string
}

variable "cluster_version" {
  description = "EKS version"
  type        = string
  default     = "1.27"
}

variable "environment" {
  description = "Environment name (dev / qa / prod)"
  type        = string
  
}