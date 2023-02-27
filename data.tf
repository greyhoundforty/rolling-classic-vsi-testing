data "ibm_network_vlan" "public" {
  depends_on = [random_integer.location]
  name       = local.deployment_location.public_vlan_name
}

data "ibm_network_vlan" "private" {
  depends_on = [random_integer.location]
  name       = local.deployment_location.private_vlan_name
}