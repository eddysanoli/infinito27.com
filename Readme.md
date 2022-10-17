# Infinito 27 Site

Website for the love of my life. Made with love and a combination of Terraform (for the infrastructure), Ansible (for the configuration management), Vue + Vite (for the site itself) and Github Actions (for the CI/CD).

-----

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

-----

## Provisioning (Ansible)

Initially the provisioning process was going to be a little bit more involved but now its almost seamless. The only thing that you need to do now is run:

```bash
# Move into the ansible directory
cd ansible

# Build and run the Ansible container
docker compose up
```

This command will create an Ansible container and run the `provision.yaml` playbook. The playbook will do the following:

- Updating the remote host
- Installing the required packages
- Configuring Nginx to connect the domain name to the site's files
- Attach an SSL certificate to the domain name

### Keep in Mind

- **SSH Keys**: The Ansible container will use your local SSH keys (`id_rsa` and `id_rsa.pub`) to connect to the remote host. Make sure that you have them in the `~/.ssh` folder and that they have the correct permissions granted (use `chmod 600 file/name` to correct that).
- **Hosts and ansible.cfg**: The Ansible container loads the `hosts` inventory file on build. If you ever re-deploy, you will also need to rebuild the Ansible container. For this just run `docker image rm ansible` and then `docker compose up` again.
- **Debugging**: If you ever need to debug the Ansible container, I included a couple of "debug instructions" at the end of the `docker-compose.yaml` file. Once uncommented they will overwrite the default entrypoint of the Ansible container and cause it to idle, making it possible for you to connect to it and navigate its internal file system.
- **Complete Teardown**: If you ever tear down the infrastructure completely, the domain `infinito27.com` will be associated with a new IP address. If you try to ssh into the server using `ssh root@infinito27.com` it will warn you of a phishing attack. This is not the case, its just that you switched the IP of your server by rebuilding everything again. Go into your `known_hosts` file and remove the entry for `infinito27.com` and then you will be able to ssh into the server again.
