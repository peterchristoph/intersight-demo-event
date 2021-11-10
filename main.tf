resource "intersight_ntp_policy" "ntp_policy" {
  name    = var.ntp_policy_name
  enabled = true
  description = var.ntp_policy_description
  ntp_servers = [
    "10.10.10.200",
    "10.10.10.210",
    "10.10.10.220",
    "10.10.10.230"
  ]
  organization {
    moid   = var.organization_moid
    object_type = "organization.Organization"
  }
}