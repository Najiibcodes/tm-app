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

variable "execution_role_name" {
  description = "Name of the ECS task execution role"
  default     = "ecsTaskExecutionRole"
}

variable "execution_policy_arn" {
  description = "IAM policy ARN for ECS task execution"
  default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

variable "lb_name" {
  description = "Name of the load balancer"
  default     = "ecsproject-lb"
}

variable "target_group_name" {
  description = "Name of the target group"
  default     = "ecsproject-tg"
}

variable "target_group_port" {
  description = "Port for the target group"
  default     = 3000
}

variable "target_group_protocol" {
  description = "Protocol for the target group"
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Path for load balancer health checks"
  default     = "/"
}

variable "health_check_interval" {
  description = "Interval between health checks"
  default     = 30
}

variable "health_check_timeout" {
  description = "Timeout for health checks"
  default     = 5
}

variable "health_check_healthy_threshold" {
  description = "Number of healthy checks before considering the target healthy"
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "Number of unhealthy checks before considering the target unhealthy"
  default     = 2
}

variable "health_check_matcher" {
  description = "HTTP status code matcher for health checks"
  default     = "200-299"
}

variable "cluster_name" {
  description = "ECS Cluster name"
  default     = "ecsproject-cluster"
}

variable "task_family" {
  description = "Task definition family name"
  default     = "ecsproject-task"
}

variable "network_mode" {
  description = "Network mode for ECS"
  default     = "awsvpc"
}

variable "compatibilities" {
  description = "ECS task compatibility types"
  default     = ["FARGATE"]
}

variable "task_cpu" {
  description = "CPU units for the ECS task"
  default     = "1024"
}

variable "task_memory" {
  description = "Memory for the ECS task"
  default     = "3072"
}

variable "container_definitions" {
  description = "Container definitions for the ECS task"
  default = [{
    name  = "tm-app-container"
    image = "156041431760.dkr.ecr.eu-west-2.amazonaws.com/ecsproject:latest"
    portMappings = [{
      containerPort = 3000
      hostPort      = 3000
    }]
  }]
}

variable "service_name" {
  description = "Name of the ECS service"
  default     = "ecsproject-service"
}

variable "desired_count" {
  description = "Desired number of ECS tasks"
  default     = 1
}

variable "launch_type" {
  description = "Launch type for the ECS service"
  default     = "FARGATE"
}

variable "health_check_grace_period_seconds" {
  description = "Grace period for health checks"
  default     = 300
}

variable "deployment_type" {
  description = "Deployment type for the ECS service"
  default     = "ECS"
}

variable "assign_public_ip" {
  description = "Assign public IP to ECS tasks"
  default     = true
}

variable "container_name" {
  description = "Name of the container"
  default     = "tm-app-container"
}

variable "container_port" {
  description = "Container port to expose"
  default     = 3000
}

variable "hosted_zone_id" {
  description = "Route53 hosted zone ID"
  default     = "Z04186936EHR64CAC2BE"
}

variable "cpu_architecture" {
  description = "CPU architecture for the ECS task"
  default     = "X86_64"
}

variable "operating_system_family" {
  description = "Operating system family for the ECS task"
  default     = "LINUX"
}

variable "http_redirect_port" {
  description = "Port for HTTP listener to redirect traffic to HTTPS"
  type        = number
  default     = 80
}

variable "https_listener_port" {
  description = "Port for HTTPS listener"
  type        = number
  default     = 443
}

variable "ssl_policy" {
  description = "SSL policy for HTTPS listener"
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
}

variable "load_balancer_type" {
  description = "Type of the load balancer (application, network, or gateway)"
  type        = string
  default     = "application"
}

variable "is_internal" {
  description = "Whether the load balancer is internal"
  type        = bool
  default     = false
}


variable "backend_bucket_name" {
  description = "The name of the S3 bucket to store the Terraform state"
  type        = string
  default     = "tm-app2"
}

variable "backend_key" {
  description = "The path for the Terraform state file in the S3 bucket"
  type        = string
  default     = "terraform/state"
}

variable "backend_region" {
  description = "The AWS region for the S3 bucket and DynamoDB table"
  type        = string
  default     = "eu-west-2"
}

variable "backend_encrypt" {
  description = "Enable server-side encryption for the S3 bucket"
  type        = bool
  default     = true
}

variable "backend_dynamodb_table" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-state-lock"
}
