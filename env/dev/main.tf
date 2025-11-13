locals {
  cluster_name = "${var.project_name}-${var.env}-eks"
}

module "network" {
  source = "../../modules/network"

  project_name = var.project_name
  env          = var.env
  cluster_name = local.cluster_name
}

module "eks" {
  source = "../../modules/eks"

  project_name      = var.project_name
  env               = var.env
  cluster_version   = var.cluster_version
  vpc_id            = module.network.vpc_id
  private_subnet_ids = module.network.private_subnets

  node_instance_type = var.node_instance_type
  node_min_size      = var.node_min_size
  node_desired_size  = var.node_desired_size
  node_max_size      = var.node_max_size
}

module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  env          = var.env
}

module "backup" {
  source = "../../modules/backup"

  project_name = var.project_name
  env          = var.env
}
