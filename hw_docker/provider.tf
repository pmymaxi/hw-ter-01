# Configure the Docker Provider
provider "docker" {
  host = "ssh://${local.username_vm}@${local.public_ip}"
  ssh_opts = [
    "-o", "StrictHostKeyChecking=no",
    "-o", "UserKnownHostsFile=/dev/null",
    "-i", "${var.ssh_key_dir}"
  ]
}

