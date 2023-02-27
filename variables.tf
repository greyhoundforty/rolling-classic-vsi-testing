variable "domain" {
  description = "Domain to use for all deployed systems"
  type        = string
  default     = "clouddesigndev.com"
}

variable "owner" {
  default = "ryantiffany"
}

variable "network_speed" {
  type    = number
  default = 1000
}

variable "dcs" {
  type = list(
    object({
      zone              = string
      datacenter        = string
      public_vlan_name  = string
      private_vlan_name = string
    })
  )
  default = [
    {
      zone              = "us-south-1"
      datacenter        = "dal10"
      public_vlan_name  = "public-dal10-vlan"
      private_vlan_name = "private-dal10-vlan"
    },
    {
      zone              = "us-south-2"
      datacenter        = "dal12"
      public_vlan_name  = "public-dal12-vlan"
      private_vlan_name = "private-dal12-vlan"
    },
    {
      zone              = "us-east-2"
      datacenter        = "wdc06"
      public_vlan_name  = "public-wdc06-vlan"
      private_vlan_name = "private-wdc06-vlan"
    },
    {
      zone              = "us-east-3"
      datacenter        = "wdc07"
      public_vlan_name  = "rtlab-public-vlan"
      private_vlan_name = "rtlab-private-vlan"
    },
    {
      zone              = "eu-gb-3"
      datacenter        = "lon06"
      public_vlan_name  = "public-lon06-vlan"
      private_vlan_name = "private-lon06-vlan"
    },
    {
      zone              = "eu-de-3"
      datacenter        = "fra04"
      public_vlan_name  = "public-fra04-vlan"
      private_vlan_name = "private-fra04-vlan"
  }]
}

variable "rocky_os_reference_code" {
  type        = string
  description = "Rocky version to be installed."
  default     = "ROCKYLINUX_8_64"
}

variable "windows_os_reference_code" {
  type        = string
  description = "The OS reference code for Windows BMs."
  default     = "WIN_2022-STD_64"
}

variable "ubuntu_os_reference_code" {
  type        = string
  description = "Ubuntu OS reference code."
  default     = "UBUNTU_20_64"
}

variable "instance_size" {
  type        = string
  description = "The instance size to use for all deployed systems"
  default     = "BL2_4X16X100"
}
