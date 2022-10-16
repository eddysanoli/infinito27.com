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

## Provisioning (Ansible)

Before creating all the infrastructure that will support the site you need to start a running instance of Ansible running inside of a Docker container (I did it this way because Ansible is not "easily" supported on Windows without doing some extra work). To do this, run the following set of commands:

```bash
# Navigate to the Ansible folder
cd ansible

# Run the Ansible container
docker-compose up -d
```

After this, whenever you apply the Terraform configurations, the Ansible playbooks found inside the `ansible` folder will be executed on the remote server, updating it and applying the necessary changes to have it work properly.

```bash
# Move to the sites-available folder
cd /etc/nginx/sites-available

# Create a new configuration file for a new route (eg. infinito27.com or www.infinito27.com)
cp default infinito27.com

# Edit the file and change the "root" and "server_name" values
vi infinito27.com

# Create a symbolic link in the sites-enabled folder
# (Not necessary but a good practice)
cd ../sites-enabled
ln -s ../sites-available/infinito27.com .

# Make sure that there is only one server block with the "listen 80 default_server" directive

# Reload the NGINX configuration
nginx -s reload
```
