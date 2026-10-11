# Require a compatible Terraform version and AWS provider.
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS provider to use the selected region.
# Credentials are read from the AWS CLI configuration.
provider "aws" {
  region = "us-east-1"
}