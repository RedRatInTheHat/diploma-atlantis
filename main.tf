terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "terraform-state-netology-diploma-ip"
    region = "ru-central1"
    key    = "states/atlantis.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # Необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

  }

  required_version = ">= 1.6.3"
}

provider "yandex" {
  service_account_key_file = file(var.sa_key_file_path)
  zone                     = var.default_zone
  folder_id                = var.folder_id
  cloud_id                 = var.cloud_id
}
