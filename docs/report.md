# Infrastructure as Code Based Cloud Deployment Using Terraform and Ansible

## 1. Introduction

This project demonstrates how to provision cloud infrastructure using Terraform and configure web servers using Ansible. The objective is to automate infrastructure creation and web server configuration instead of performing these tasks manually.

## 2. Objectives

- Provision two Ubuntu EC2 instances using Terraform.
- Configure cloud networking and security rules.
- Install and configure Nginx using Ansible.
- Deploy a simple static website to both servers.
- Use scripts to support deployment, cleanup, and testing.

## 3. Technologies Used

- Amazon Web Services (AWS)
- Terraform
- Ansible
- Ubuntu Linux
- Nginx
- Git and GitHub
- Bash scripting
- HTML and Jinja2 templates

## 4. Project Architecture

Terraform defines the cloud infrastructure, including the EC2 instances, security group, and SSH key pair. Ansible connects to the servers over SSH, installs Nginx, and deploys the website template.

HTTP traffic uses port 80. SSH administration uses port 22 and should be restricted to the administrator's current public IP address.

## 5. Implementation

### Terraform

Terraform configuration files define the AWS provider, input variables, Ubuntu AMI selection, networking, security group, SSH key pair, and two EC2 instances.

### Ansible

The Ansible playbook updates the package cache, installs Nginx, ensures that the service is enabled and running, and deploys the Jinja2 website template.

The website displays the project title, team member placeholders, and server-specific hostname and IP information.

### Automation Scripts

- `scripts/deploy.sh` initializes, formats, validates, and plans Terraform changes.
- `scripts/destroy.sh` requires explicit confirmation before running Terraform destroy and checks for a non-empty local state file.
- `scripts/test.sh` checks Terraform formatting and validity, Ansible playbook syntax, and the website template.

## 6. Testing

Local checks have been run for Terraform formatting and validation, Ansible playbook syntax, and website template existence.

Live deployment, SSH connectivity, HTTP access, and Nginx verification must be tested after infrastructure is approved, created, and configured with a valid Ansible inventory and SSH key.

## 7. Security and Cost Considerations

- Do not commit private SSH keys, AWS credentials, Terraform state, or saved plan files.
- Restrict SSH access to trusted IP addresses.
- Review the AWS account's current Free plan benefits and estimated costs before provisioning resources.
- Destroy project resources when they are no longer needed, after verifying the correct Terraform state and AWS resources.

## 8. Conclusion

The project provides a basic example of Infrastructure as Code. Terraform describes and provisions the infrastructure, while Ansible automates server configuration and website deployment. The scripts and documentation support repeatable testing and responsible resource management.

## 9. Current Project Status

The Terraform configuration and Ansible files are prepared, and local validation checks pass. Actual AWS deployment and end-to-end website verification remain pending.
