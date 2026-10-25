#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TERRAFORM_DIR="$PROJECT_DIR/terraform"

cd "$TERRAFORM_DIR"

if [[ ! -s terraform.tfstate ]]; then
  echo "No non-empty local Terraform state file found."
  echo "Refusing to destroy resources."
  echo "Check that you are using the correct Terraform working directory and state."
  exit 1
fi

echo "WARNING: Terraform may destroy resources tracked in this state."
echo "Review the state and AWS resources before proceeding."
read -r -p 'Type DESTROY to continue: ' confirmation

if [[ "$confirmation" != "DESTROY" ]]; then
  echo "Cancelled. No destroy command was run."
  exit 0
fi

terraform destroy
