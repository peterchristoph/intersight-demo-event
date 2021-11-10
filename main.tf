resource "intersight_ntp_policy" "ntp1" {
  name    = var.ntp_policy_name
  enabled = true
  description = var.ntp_policy_description
  ntp_servers = [
    "10.10.10.10",
    "10.10.10.11",
    "10.10.10.12",
    "10.10.10.13"
  ]
  organization {
    moid   = var.organization_moid
    object_type = "organization.Organization"
  }
}