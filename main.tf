resource "intersight_ntp_policy" "ntp_policy" {
  name    = var.ntp_policy_name
  enabled = true
  description = var.ntp_policy_description
  ntp_servers = [
    "10.10.10.200",
    "10.10.10.21",
    "10.10.10.22",
    "10.10.10.23"
  ]
  organization {
    moid   = var.organization_moid
    object_type = "organization.Organization"
  }
}

# LAN Connectivity and other network policies
resource "intersight_vnic_lan_connectivity_policy" "lan" {
  name            = var.lan_connectivity_policy_name
  description     = "Terraform Cloud LAN Connectivity Policy"
  placement_mode  = "auto"
  target_platform = "FIAttached"
  organization {
    moid        = var.organization_moid
    object_type = "organization.Organization"
  }
}

# Required Ethernet policies with default values
resource "intersight_fabric_eth_network_control_policy" "network_control" {
  name        = "tf-module-ethernet-network-control-policy"
  description = "Terraform Cloud Fabric Ethernet Network Control Policy"
  cdp_enabled = false
  forge_mac    = "allow"

  /*
  lldp_settings = {
    objectType       = "fabric.LldpSettings"
    receive_enabled  = false
    transmit_enabled = false
  }*/

  mac_registration_mode = "allVlans"
  uplink_fail_action    = "linkDown"

  organization {
    object_type = "organization.Organization"
    moid        = var.organization_moid
  }
}

resource "intersight_vnic_eth_adapter_policy" "ethernet_adapter" {
  name                    = "tf-module-ethernet-adapter-policy"
  rss_settings            = true
  uplink_failback_timeout = 5
  organization {
    object_type = "organization.Organization"
    moid        = var.organization_moid
  }

  vxlan_settings {
    enabled = false
  }

  nvgre_settings {
    enabled = false
  }

  arfs_settings {
    enabled = false
  }

  interrupt_settings {
    coalescing_time = 125
    coalescing_type = "MIN"
    nr_count        = 4
    mode            = "MSIx"
  }
  completion_queue_settings {
    nr_count  = 4
    ring_size = 1
  }
  rx_queue_settings {
    nr_count  = 1
    ring_size = 512
  }
  tx_queue_settings {
    nr_count  = 1
    ring_size = 256
  }
  tcp_offload_settings {
    large_receive = true
    large_send    = true
    rx_checksum   = true
    tx_checksum   = true
  }
}

resource "intersight_vnic_eth_qos_policy" "ethernet_qos" {
  name        = "tf-module-ethernet-qos-policy"
  description = "Terraform Cloud Ethernet Quality of Service"
  mtu         = 1500
  organization {
    object_type = "organization.Organization"
    moid        = var.organization_moid
  }
}

resource "intersight_fabric_eth_network_group_policy" "network_group" {
  name        = "tf-module-fabric-eth-network-group-policy"
  description = "Terraform Cloud Cluster Network"
  organization {
    object_type = "organization.Organization"
    moid        = var.organization_moid
  }
  vlan_settings {
    allowed_vlans = 101
    native_vlan   = 1
  }
}

resource "intersight_vnic_eth_if" "eth0" {
  name  = var.vnic_name_0
  order = 0
  placement {
    id        = "MLOM"
    pci_link  = 0
    uplink    = 0
    switch_id = "A"
  }
  failover_enabled = true
  mac_pool {
    object_type = "macpool.Pool"
    selector    = "Name eq '${var.mac_pool}'"
  }
  lan_connectivity_policy {
    moid        = intersight_vnic_lan_connectivity_policy.lan.id
    object_type = "vnic.LanConnectivityPolicy"
  }
  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.network_group.id
  }
  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.network_control.id
  }
  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.ethernet_adapter.id
  }
  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.ethernet_qos.id
  }
}

*/
resource "intersight_vnic_eth_if" "ucs-demo-nicb" {
  name  = var.vnic_name_1
  order = 1
  placement {
    id        = "MLOM"
    pci_link  = 0
    uplink    = 0
    switch_id = "B"
  }
  failover_enabled = true
  mac_pool {
    object_type = "macpool.Pool"
    selector    = "Name eq '${var.mac_pool}'"
  }
  lan_connectivity_policy {
    moid        = intersight_vnic_lan_connectivity_policy.lan.id
    object_type = "vnic.LanConnectivityPolicy"
  }
  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.network_group.id
  }
  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.network_control.id
  }
  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.ethernet_adapter.id
  }
  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.ethernet_qos.id
  }/*
}
