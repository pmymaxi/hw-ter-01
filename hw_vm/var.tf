# Variable Yandex Cloud configure placement VM
variable "folder_id"         { type = string }
variable "zone_id"           { type = string }
variable "cloud_id"          { type = string }

# Variable provider Yandex Cloud
variable "YC_TOKEN"          { sensitive = true }

# Variable resource VM 
variable "name_vm"           { type = string }
variable "hostname"          { type = string }
variable "description_vm"    { type = string }
variable "cores_vm"          { type = number }
variable "cpu_platform"      { type = string }
variable "core_fraction"     { type = number }
variable "memory"            { type = number }
variable "scheduling_policy" {  type = bool  }
variable "disk_size"         { type = number }
variable "disk_type"         { type = string }
variable "family_image"      { type = string }
variable "username_vm"       { type = string }
variable "add_user_group"    { type = string }
variable "subnet_id"         { type = string }
variable "nat"               {  type = bool  }
