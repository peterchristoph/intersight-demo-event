################################################################################
# NTP Policy Variables
variable "organization_moid" {
  default = "Default"
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