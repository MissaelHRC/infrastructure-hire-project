output "s3_bucket_name" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.missael_hire_project_bucket.id
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.missael_hire_project_bucket.arn
}

output "ecr_registry_app_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.missael_hire_project_ecr_repository_app.repository_url
}

output "ecr_repository_app_name" {
  description = "The Name of the ECR repository"
  value       = aws_ecr_repository.missael_hire_project_ecr_repository_app.id
}

output "ecr_registry_app_arn" {
  description = "The ARN of the ECR repository"
  value       = aws_ecr_repository.missael_hire_project_ecr_repository_app.arn
}

output "ecr_registry_proxy_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.missael_hire_project_ecr_repository_proxy.repository_url
}

output "ecr_repository_proxy_name" {
  description = "The Name of the ECR repository"
  value       = aws_ecr_repository.missael_hire_project_ecr_repository_proxy.id
}

output "ecr_registry_proxy_arn" {
  description = "The ARN of the ECR repository"
  value       = aws_ecr_repository.missael_hire_project_ecr_repository_proxy.arn
}

output "cluster_id" {
  description = "The Name of Cluster"
  value       = module.eks.cluster_id
}

output "irsa_s3_arn" {
  description = "The ARN of S3 Role"
  value       = module.iam_assumable_role_s3.iam_role_arn
}

