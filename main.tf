resource "intersight_ntp_policy" "ntp_policy" {
  name    = var.ntp_policy_name
  enabled = true
  description = var.ntp_policy_description
  ntp_servers = [
    "10.10.10.20",
    "10.10.10.21",
    "10.10.10.22",
    "10.10.10.23"
  ]
  organization {
    moid   = var.organization_moid
    object_type = "organization.Organization"
  }
}