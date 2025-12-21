data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "vpc" {
  source = "./modules/vpc"

  name            = var.project_name
  cidr_block      = "10.0.0.0/16"
  azs             = ["ap-south-1a", "ap-south-1b"]
  public_subnets  = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnets = ["10.0.10.0/24", "10.0.11.0/24"]
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.project_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnet_ids
  node_role_arn       = module.node_group.node_role_arn
  admin_principal_arn = "arn:aws:iam::${local.account_id}:user/mohammed.suheal"
}

module "node_group" {
  source = "./modules/node-group"

  cluster_name = module.eks.cluster_name
  subnet_ids   = module.vpc.private_subnet_ids
  environment  = var.environment
  cluster_version = var.cluster_version
}