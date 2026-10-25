#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TERRAFORM_DIR="$PROJECT_DIR/terraform"
ANSIBLE_DIR="$PROJECT_DIR/ansible"

echo "==> Checking Terraform formatting"
terraform -chdir="$TERRAFORM_DIR" fmt -check

echo "==> Validating Terraform configuration"
terraform -chdir="$TERRAFORM_DIR" init -backend=false
terraform -chdir="$TERRAFORM_DIR" validate

echo "==> Checking Ansible playbook syntax"
ansible-playbook -i 'web1,web2,' \
  --syntax-check "$ANSIBLE_DIR/site.yml"

echo "==> Checking website template"
test -f "$ANSIBLE_DIR/templates/index.html.j2"
echo "Website template exists."

echo
echo "All local checks passed."
echo "No AWS resources were created or changed."
