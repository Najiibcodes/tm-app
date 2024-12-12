variable "lb_name" {
  description = "Name of the Load Balancer"
  type        = string
}

variable "security_groups" {
  description = "List of security groups for the Load Balancer"
  type        = list(string)
}

variable "subnets" {
  description = "Subnets for the Load Balancer"
  type        = list(string)
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS listener"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "Port for the target group"
  type        = number
}

variable "target_group_protocol" {
  description = "Protocol for the target group (HTTP or HTTPS)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the target group"
  type        = string
}

variable "health_check_path" {
  description = "Path for health checks"
  type        = string
}

variable "health_check_interval" {
  description = "Interval for health checks (in seconds)"
  type        = number
}

variable "health_check_timeout" {
  description = "Timeout for health checks (in seconds)"
  type        = number
}

variable "health_check_healthy_threshold" {
  description = "Number of healthy checks before a target is considered healthy"
  type        = number
}

variable "health_check_unhealthy_threshold" {
  description = "Number of unhealthy checks before a target is considered unhealthy"
  type        = number
}

variable "health_check_matcher" {
  description = "HTTP status code matcher for health checks"
  type        = string
}

variable "http_redirect_port" {
  description = "Port for HTTP listener to redirect traffic to HTTPS"
  type        = number
}

variable "https_listener_port" {
  description = "Port for HTTPS listener"
  type        = number
}

variable "ssl_policy" {
  description = "SSL policy for HTTPS listener"
  type        = string
}

variable "is_internal" {
  description = "Whether the load balancer is internal"
  type        = bool
}

variable "load_balancer_type" {
  description = "Type of the load balancer (application, network, or gateway)"
  type        = string
}

