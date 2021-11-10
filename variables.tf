################################################################################
# NTP Policy Variables
variable "organization_moid" {
  default = ""
  type = string
}
variable "ntp_policy_name" {
  type = string
  default = "tf_ntp_policy"
}
variable "ntp_policy_description" {
  default = "Createt over Terraform Cloud"
  type = string
}

variable "intersight_api_key" {
  description = "Intersight API Key"
  type = string
}

variable "intersight_secret_key" {
  description = "Intersight Secrete API Key"
  type = string
}

variable "lan_connectivity_policy_name" {
  description = "Name of the LAN connectivitiy policy"
  type = string
}

variable "mac_pool" {
  type        = string
  description = "MAC Address Pool used by VNIC Ethernet Interfaces and LAN Connectivity Policy"
  default     = null
}

variable "vnic_name_0" {
  type = string
  default = "eth0"
}

variable "vnic_name_1" {
  type = string
  default = "eth1"
}