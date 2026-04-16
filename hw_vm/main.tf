# Yandex create VM

resource "yandex_compute_instance" "hw-vm" {
  name        = var.name_vm
  hostname    = var.hostname
  platform_id = var.cpu_platform
  zone        = var.zone_id
  description = var.description_vm
  folder_id   = var.folder_id

  resources {
    cores         = var.cores_vm
    core_fraction = var.core_fraction
    memory        = var.memory
  }

  scheduling_policy {
    preemptible = var.scheduling_policy
  }

  boot_disk {
    initialize_params {
      size     = var.disk_size
      image_id = data.yandex_compute_image.dist_image.id
      type     = var.disk_type
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.nat
  }

  metadata = {
    user-data = "${local.ssh_data}"
  }

}

