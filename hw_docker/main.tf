# Add ssh permission to use a known host in the local host file

resource "null_resource" "known_host" {
  provisioner "local-exec" {
    command = "until ssh-keyscan -H ${local.public_ip} >> ~/.ssh/known_hosts; do sleep 2; done"
  }
}

resource "null_resource" "check_status_docker" {
  provisioner "local-exec" {
    command = "ssh -o StrictHostKeyChecking=no -i ${var.ssh_key_dir} ${local.username_vm}@${local.public_ip} 'docker --version; sleep 5; exit'"
    #command = "until nc -z ${local.public_ip} 22; do sleep 5; done"
  }
}



# Docker create conainer in yandex cloud VM 

resource "docker_image" "hw-image" {
  name = var.name_image
  keep_locally = true
}

# Start a container
resource "docker_container" "hw-container" {
  name  = var.name_container
  image = docker_image.hw-image.image_id

  ports {
    internal = var.ports_in
    external = var.ports_ext
    ip       = var.ext_ip
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.pass_db.result}",
    "MYSQL_DATABASE= ${var.MYSQL_DATABASE}",
    "MYSQL_USER=${var.MYSQL_USER}",
    "MYSQL_PASSWORD=${random_password.pass_user.result}",
    "MYSQL_ROOT_HOST=${var.MYSQL_ROOT_HOST}"
  ]

}

# Local provider for generation password

resource "random_password" "pass_db" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "pass_user" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

