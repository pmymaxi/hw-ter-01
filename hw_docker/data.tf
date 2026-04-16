data "terraform_remote_state" "hw-vm" {
  backend = "local"
  config = {
    path = "../hw_vm/terraform.tfstate"
  }
}
locals {
  public_ip = data.terraform_remote_state.hw-vm.outputs.public_ip
  username_vm = data.terraform_remote_state.hw-vm.outputs.username_vm
}