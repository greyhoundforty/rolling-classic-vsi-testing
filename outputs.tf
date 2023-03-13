output "ubuntu_instance_id" {
  value = ibm_compute_vm_instance.ubuntu.id
}

output "rocky_instance_id" {
  value = ibm_compute_vm_instance.rocky.id
}

output "windows_instance_id" {
  value = ibm_compute_vm_instance.windows.id
}

output "jsonencoded_output" {
  value = jsonencode(ibm_compute_vm_instance.ubuntu)
  sensitive = true
}
