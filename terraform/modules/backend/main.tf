data "aws_s3_bucket" "existing_bucket" {
  bucket = var.bucket_name
}

data "aws_dynamodb_table" "existing_table" {
  name = var.dynamodb_table
}

