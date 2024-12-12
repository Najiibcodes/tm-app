variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet1_cidr" {
  description = "CIDR block for the first public subnet"
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR block for the second public subnet"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones for subnets"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "destination_cidr_block" {
  description = "Destination CIDR block for the default route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {
    Name = "main-vpc"
  }
}

variable "igw_tags" {
  description = "Tags for the internet gateway"
  type        = map(string)
  default     = {
    Name = "main-igw"
  }
}

variable "route_table_tags" {
  description = "Tags for the public route table"
  type        = map(string)
  default     = {
    Name = "public-rt"
  }
}

variable "subnet1_tags" {
  description = "Tags for the first public subnet"
  type        = map(string)
  default     = {
    Name = "public-subnet-1"
  }
}

variable "subnet2_tags" {
  description = "Tags for the second public subnet"
  type        = map(string)
  default     = {
    Name = "public-subnet-2"
  }
}
