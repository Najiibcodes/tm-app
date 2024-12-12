output "backend_s3_bucket" {
  description = "The S3 bucket used for storing the Terraform state"
  value       = var.bucket_name
}

output "backend_dynamodb_table" {
  description = "The DynamoDB table used for state locking"
  value       = var.dynamodb_table
}
