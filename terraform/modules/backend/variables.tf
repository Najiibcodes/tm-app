variable "bucket_name" {
  description = "The name of the S3 bucket to store the Terraform state"
  type        = string
}

variable "key" {
  description = "The path for the Terraform state file in the S3 bucket"
  type        = string
}

variable "region" {
  description = "The AWS region for the S3 bucket and DynamoDB table"
  type        = string
}

variable "encrypt" {
  description = "Enable server-side encryption for the S3 bucket"
  type        = bool
  default     = true
}

variable "dynamodb_table" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
}
