output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.network.private_subnets
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.network.public_subnets
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS API endpoint"
  value       = module.eks.cluster_endpoint
}

output "ecr_frontend_repository_url" {
  description = "ECR URL for frontend images"
  value       = module.ecr.frontend_repository_url
}

output "ecr_backend_repository_url" {
  description = "ECR URL for backend images"
  value       = module.ecr.backend_repository_url
}

output "backup_bucket_name" {
  description = "Backup S3 bucket name"
  value       = module.backup.backup_bucket_name
}
