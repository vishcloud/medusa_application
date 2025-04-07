variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "medusa"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "vishal"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "container_image" {
  description = "Docker image for Medusa application"
  type        = string
  default     = "767397914878.dkr.ecr.us-west-1.amazonaws.com/medusa:latest"
}

variable "container_port" {
  description = "Port on which Medusa application runs"
  type        = number
  default     = 9000
}

variable "container_cpu" {
  description = "CPU units for the container"
  type        = number
  default     = 256
}

variable "container_memory" {
  description = "Memory for the container"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Desired count of tasks"
  type        = number
  default     = 2
}

resource "aws_ecr_repository" "medusa" {
  name = "medusa"
}

