/* ============================================ */
/* NANODE                                       */
/* ============================================ */

# 1 GB Nanode
resource "linode_instance" "website_server" {
    label = "infinito27-server"
    image = "linode/debian11"
    region = "us-southeast"

    # All linode terraform types:
    # https://api.linode.com/v4/linode/types
    type = "g6-nanode-1" 

    # Root password for the nanode
    root_pass = var.NANODE_ROOT_PASS

    # Authorized SSH keys
    authorized_keys = [
        var.PUBLIC_SSH_KEY
    ]
}

/* ============================================ */
/* DOMAIN                                       */
/* ============================================ */

# Infinito27 Domain
resource "linode_domain" "website_domain" {

    # Namecheap domain
    domain = "infinito27.com"

    # Either "master" or "slave". Master domains are authoritative for their
    # domain, and slave domains are not.
    type = "master"

    # Address that reaches you but its outside your domain and ideally
    # doesn't require your linode to be operational. Gmail for example
    soa_email = "eddysanoli@gmail.com"
}

/* ============================================ */
/* DOMAIN RECORDS                               */
/* ============================================ */

# Infinito27 Main Domain Record (No Prefix)
# (For example: infinito27.com)
resource "linode_domain_record" "website_domain_record" {
    domain_id = linode_domain.website_domain.id
    name = "infinito27.com"
    record_type = "A"
    target = linode_instance.website_server.ip_address
}

# Infinito27 WWW Domain Record
# (For example: www.infinito27.com)
resource "linode_domain_record" "website_domain_record_www" {
    domain_id = linode_domain.website_domain.id
    name = "www.infinito27.com"
    record_type = "CNAME"

    # This wont target to the IP address of the linode instance
    # but the "A" record of the domain name so that both lead to the same page
    target = "infinito27.com" 
}