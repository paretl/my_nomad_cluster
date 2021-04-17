
resource "scaleway_instance_server" "nomad_consul_master" {
  type  = "STARDUST1-S"
  image = "centos_8"
  name  = "nomad_consul_master_1"

  # Public IP
  ip_id = scaleway_instance_ip.nomad_consul_master_ip.id

  # SG
  security_group_id = scaleway_instance_security_group.master.id
}

resource "scaleway_instance_ip" "nomad_consul_master_ip" {}

resource "scaleway_instance_security_group" "master" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = "22"
    ip     = "109.26.56.8"
  }

  inbound_rule {
    action = "accept"
    port   = "8500"
  }

  inbound_rule {
    action   = "accept"
    ip_range = "10.0.0.0/8"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "10.0.0.0/8"
  }

  outbound_rule {
    action   = "accept"
    ip_range = "0.0.0.0/0"
  }
}

resource "scaleway_instance_private_nic" "master" {
  server_id          = scaleway_instance_server.nomad_consul_master.id
  private_network_id = scaleway_vpc_private_network.private.id
}
