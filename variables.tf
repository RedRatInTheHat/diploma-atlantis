variable "sa_key_file_path" {
  type        = string
  default     = "~/key.json"
  description = "The path to the service account key file"
}

variable "atlantis_sa_key_file_path" {
  type        = string
  description = "The path to the service account key file"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "service_account_id" {
  type        = string
  description = "The ID of the service account"
}

# VPC

variable "vpc_name" {
  type        = string
  default     = "atlantis-vpc"
  description = "Name of the VPC."
}

variable "vpc_subnets" {
  type = list(object({
    vpc_zone = string
    vpc_cidr = string
  }))
  default = [
    { vpc_zone = "ru-central1-d", vpc_cidr = "192.168.14.0/24" },
  ]
  description = "List of public subnets for the VPC, including zone and CIDR."
}


# VM

variable "instances_count" {
  type        = number
  default     = 1
  description = "Number of instances to create."
}

variable "instance_name" {
  type        = string
  default     = "atlantis"
  description = "Name of the instance."
}

variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "The image family to use for the instance."
}

variable "has_nat" {
  type        = bool
  default     = true
  description = "Whether to enable NAT for the instance."
}

variable "is_allowed_stopping_for_update" {
  type        = bool
  default     = true
  description = "Whether to allow stopping the instance for updates."
}

variable "platform_id" {
  type        = string
  default     = "standard-v3"
  description = "The platform ID for the instance."
}

variable "is_preemptible" {
  type        = bool
  default     = false
  description = "Whether the instance is preemptible."
}

variable "resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  description = "Resource configuration for the instance."
}

# Cloud init

variable "cloud_init_path" {
  type        = string
  default     = "./cloud-init.yml"
  description = "Path to the init file"
}

variable "vms_ssh_key" {
  type        = string
  description = "SSH key for cluster vms user"
}

variable "atlantis_version" {
  type        = string
  default     = "v0.32.0"
  description = "Version of Atlantis Docker image"
}

variable "github_user" {
  type        = string
  default     = "RedRatInTheHat"
  description = "Username of the Terraform repository owner"
}

variable "github_token" {
  type        = string
  description = "Token of the Terraform repository owner"
}

variable "webhook_secret" {
  type        = string
  description = "Secret of the github webhooks"
}

variable "github_repository" {
  type        = string
  default     = "github.com/RedRatInTheHat/terraform-for-k8s"
  description = "Repository the Terraform project stored in"
}

variable "bucket_access_key" {
  type        = string
  description = "Access key for bucket access"
}

variable "bucket_secret_key" {
  type        = string
  description = "Secret key for bucket access"
}

variable "key_id" {
  type        = string
  description = "Id of the service account key"
}

variable "key_created_at" {
  type        = string
  description = "The date of the service account key creation"
}

variable "key_algorithm" {
  type        = string
  description = "The algorithm the servive account key was created with"
}

variable "public_key" {
  type        = string
  description = "Public part of the service account key"
}

variable "private_key" {
  type        = string
  description = "Private part of the service account key"
}
