# Display the public IPv4 addresses of both EC2 instances.
output "public_ips" {
  description = "Public IPv4 addresses of the two EC2 instances"
  value       = aws_instance.web[*].public_ip
}

# Display the SSH username used by Ubuntu images.
output "ssh_user" {
  description = "SSH username for Ubuntu EC2 instances"
  value       = "ubuntu"
}

# Display the local path of the generated private key.
output "private_key_file" {
  description = "Local path to the generated private SSH key"
  value       = pathexpand(var.private_key_file)
}

# Display the Ubuntu AMI selected by Terraform.
output "ubuntu_ami_id" {
  description = "Ubuntu 22.04 LTS AMI ID selected for this deployment"
  value       = data.aws_ami.ubuntu.id
}

# Display the AWS region.
output "aws_region" {
  description = "AWS deployment region"
  value       = var.aws_region
}