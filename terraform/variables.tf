# AWS region where the project resources will be created.
variable "aws_region" {
  description = "AWS region for the deployment"
  type        = string
  default     = "us-east-1"
}

# Number of Ubuntu EC2 instances.
variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 2

  validation {
    condition     = var.instance_count == 2
    error_message = "This project requires exactly two EC2 instances."
  }
}

# Small instance type selected for the student project.
# Confirm its current Free Tier eligibility in your AWS account.
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# AWS EC2 key-pair name.
variable "key_name" {
  description = "Name of the AWS EC2 key pair"
  type        = string
  default     = "terraform-ansible-key"
}

# Local filename for the generated private SSH key.
variable "private_key_file" {
  description = "Local path for the generated private SSH key"
  type        = string
  default     = "terraform-ansible-key.pem"
}

# Name used to identify this project's AWS resources.
variable "project_name" {
  description = "Project name used in resource tags"
  type        = string
  default     = "terraform-ansible-cloud-deployment"
}