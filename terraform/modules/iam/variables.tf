variable "execution_role_name" {
  description = "Name of the ECS task execution role"
  type        = string
}

variable "execution_policy_arn" {
  description = "Policy ARN to attach to the ECS task execution role"
  type        = string
}

variable "assume_role_policy" {
  description = "JSON-encoded assume role policy for the ECS task execution role"
  type        = string
  default     = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOT
}
