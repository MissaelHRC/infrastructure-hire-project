output "s3_bucket_name" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.missael_hire_project_bucket.id
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.missael_hire_project_bucket.arn
}

output "ecr_registry_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.missael_hire_project_ecr_repository.repository_url
}

output "ecr_repository_name" {
  description = "The Name of the ECR repository"
  value       = aws_ecr_repository.missael_hire_project_ecr_repository.id
}

output "ecr_registry_arn" {
  description = "The ARN of the ECR repository"
  value       = aws_ecr_repository.missael_hire_project_ecr_repository.arn
}

