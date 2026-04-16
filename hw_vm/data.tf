data "yandex_compute_image" "dist_image" {
  family = var.family_image
}

output "public_ip" {
  value = yandex_compute_instance.hw-vm.network_interface[0].nat_ip_address
}
output "local_ip" {
  value = yandex_compute_instance.hw-vm.network_interface[0].ip_address
}
output "username_vm" {
  value = var.username_vm
}
locals {
  public_ip = yandex_compute_instance.hw-vm.network_interface[0].nat_ip_address
}
locals {
  ssh_data = templatefile("${path.module}/ssh.tpl", {
    name       = var.username_vm
    groups     = var.add_user_group
    passwd     = file("passwd.key")
    ssh_public = file("public.key")
  })
}
