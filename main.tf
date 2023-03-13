locals {
  prefix              = random_string.prefix.result
  deployment_location = var.dcs[random_integer.location.result]
  tags = [
    "provider:ibm",
    "project:${local.prefix}",
    "ephemeral-test",
    "owner:${var.owner}",
    "datacenter:${local.deployment_location.datacenter}"
  ]
}

resource "random_string" "prefix" {
  length  = 4
  special = false
  upper   = false
  numeric = false
}

resource "random_integer" "location" {
  min = 0
  max = 5

}

resource "ibm_compute_vm_instance" "ubuntu" {
  hostname          = "${local.prefix}-ubuntu"
  os_reference_code = var.ubuntu_os_reference_code
  domain            = var.domain
  datacenter        = local.deployment_location.datacenter
  network_speed     = var.network_speed
  hourly_billing    = true
  flavor_key_name   = var.instance_size
  local_disk        = true
  tags              = local.tags
  user_metadata     = file("${path.module}/init.yml")
}

resource "ibm_compute_vm_instance" "rocky" {
  hostname          = "${local.prefix}-rocky"
  os_reference_code = var.rocky_os_reference_code
  domain            = var.domain
  datacenter        = local.deployment_location.datacenter
  network_speed     = 1000
  hourly_billing    = true
  flavor_key_name   = var.instance_size
  local_disk        = true
  tags              = local.tags
  user_metadata     = file("${path.module}/init.yml")
}

resource "ibm_compute_vm_instance" "windows" {
  hostname          = "${local.prefix}-windows"
  os_reference_code = var.windows_os_reference_code
  domain            = var.domain
  datacenter        = local.deployment_location.datacenter
  network_speed     = 1000
  hourly_billing    = true
  flavor_key_name   = var.instance_size
  local_disk        = true
  tags              = local.tags
}
