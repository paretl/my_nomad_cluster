
resource "scaleway_instance_server" "nomad_consul_client" {
  count = 1

  type  = "DEV1-S"
  image = "centos_8"
  name  = "nomad_consul_client_${count.index}"

  # Public IP
  ip_id = scaleway_instance_ip.nomad_consul_client_ip[count.index].id

  # SG
  security_group_id = scaleway_instance_security_group.client.id
}

resource "scaleway_instance_ip" "nomad_consul_client_ip" {
  count = 1
}


resource "scaleway_instance_security_group" "client" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = "22"
    ip     = "109.26.56.8"
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

resource "scaleway_instance_private_nic" "client" {
  count = 1

  server_id          = scaleway_instance_server.nomad_consul_client[count.index].id
  private_network_id = scaleway_vpc_private_network.private.id
}
