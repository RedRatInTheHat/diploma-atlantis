module "atlantis_vpc" {
  source = "git::https://github.com/RedRatInTheHat/simple-vpc.git?ref=36f6f3c"

  vpc_name    = var.vpc_name
  vpc_subnets = var.vpc_subnets
}

module "atlantis_vm" {
  source = "git::https://github.com/RedRatInTheHat/simple-vms.git?ref=1a892e1"

  instances_count = var.instances_count

  instance_name = var.instance_name
  image_family  = var.image_family

  subnets = [
    for subnet in module.atlantis_vpc.subnet_info : {
      "subnet_id" : subnet.id,
      "subnet_zone" : subnet.zone
    }
  ]

  has_nat                   = var.has_nat
  allow_stopping_for_update = var.is_allowed_stopping_for_update
  platform_id               = var.platform_id
  is_preemptible            = var.is_preemptible

  resources = {
    cores         = var.resources.cores
    memory        = var.resources.memory
    core_fraction = var.resources.core_fraction
  }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
  }
}

data "template_file" "cloudinit" {
  template = file(var.cloud_init_path)

  vars = {
    ssh_key          = var.vms_ssh_key
    atlantis_version = var.atlantis_version
    gh_user          = var.github_user
    gh_token         = var.github_token
    webhook_secret   = var.webhook_secret
    repo             = var.github_repository

    cloud_id           = var.cloud_id
    folder_id          = var.folder_id
    service_account_id = var.service_account_id
    vms_ssh_key        = var.vms_ssh_key
    sa_key_file_path   = var.atlantis_sa_key_file_path

    bucket_access_key = var.bucket_access_key
    bucket_secret_key = var.bucket_secret_key

    key_id         = var.key_id
    key_created_at = var.key_created_at
    key_algorithm  = var.key_algorithm
    public_key     = var.public_key
    private_key    = var.private_key
  }
}
