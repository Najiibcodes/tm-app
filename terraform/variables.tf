variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  description = "CIDR block for the first public subnet"
  default     = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  description = "CIDR block for the second public subnet"
  default     = "10.0.2.0/24"
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate"
  default     = "arn:aws:acm:eu-west-2:156041431760:certificate/fa2df4f9-2d87-4840-9b2a-d1e343e1e13f"
}

variable "domain_name" {
  description = "The base domain name for the hosted zone"
  type        = string
  default     = "najiib.co.uk"
}

variable "subdomain" {
  description = "The subdomain to create a record for"
  type        = string
  default     = "tm"
}