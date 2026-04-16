# Variable resource Docker container
variable "name_image"        { type = string }
variable "name_container"    { type = string }
variable "ports_in"          { type = number }
variable "ports_ext"         { type = number }
variable "ext_ip"            { type = string }

# VAriable ssh for Docker container
variable "ssh_key_dir"       { type = string }


# Variable resource Docker image env
variable "MYSQL_DATABASE" {
  type      = string
  sensitive = true
}
variable "MYSQL_USER" {
  type      = string
  sensitive = true
}
variable "MYSQL_ROOT_HOST" {
  type      = string
  sensitive = true
}
