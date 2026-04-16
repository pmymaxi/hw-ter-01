# Configure the Yandex Cloud Provider
provider "yandex" {
  token     = var.YC_TOKEN
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone_id
}

