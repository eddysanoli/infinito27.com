# Infinito 27 Site

Website for the love of my life. Made with a combination of Terraform (for the infrastructure), Ansible (for the configuration management), Svelte (for the frontend) and Github Actions (for the CI/CD).

## Infrastructure (Terraform)

The infrastructure is managed with Terraform. It is hosted on a 1GB Linode Nano instance. To deploy it use the following commands:

```bash
# Initialize Terraform
terraform init

# Plan the changes
terraform plan

# Apply the changes (Without a confirmation prompt)
terraform apply -auto-approve
```

If you ever want to take down the infrastructure, use the following command:

```bash
# Destroy the infrastructure
terraform destroy -auto-approve
```

**Notes**

- The `terraform.tfvars` file is not included in the repo since its doing the same job as a `.env` file. It contains sensitive information like the linode API key.
- The file `.terraform.lock.hcl` and folder `.terraform` are created automatically when running the command `terraform init`.
