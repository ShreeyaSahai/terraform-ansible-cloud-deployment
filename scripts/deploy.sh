#!/usr/bin/env bash
set -euo pipefail

# Prepare and validate Terraform without creating AWS resources.
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TERRAFORM_DIR="$PROJECT_DIR/terraform"

cd "$TERRAFORM_DIR"

echo "==> Initializing Terraform"
terraform init

echo "==> Formatting Terraform files"
terraform fmt -check

echo "==> Validating Terraform configuration"
terraform validate

echo "==> Creating execution plan only"
terraform plan -out=tfplan

echo
echo "Plan created at terraform/tfplan."
echo "Review costs and permissions before anyone runs terraform apply."
echo "This script does not launch or destroy resources."
