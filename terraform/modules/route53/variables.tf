variable "domain_name" {
  description = "The base domain name for the hosted zone"
  type        = string
}

variable "subdomain" {
  description = "The subdomain to create a record for"
  type        = string
}

variable "hosted_zone_id" {
  description = "The hosted zone ID for Route53"
  type        = string
}

variable "alb_dns_name" {
  description = "The DNS name of the ALB"
  type        = string
}

variable "alb_zone_id" {
  description = "The Hosted Zone ID of the ALB"
  type        = string
}
