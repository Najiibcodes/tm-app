provider "aws" {
  region = "eu-west-2"
}
terraform {
  backend "s3" {
    bucket         = "tm-app2"
    key            = "terraform/state"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}

