
resource "scaleway_instance_server" "nomad_consul_client" {
  count = 1

  type  = "DEV1-S"
  image = "centos_8"
  name  = "nomad_consul_client_${count.index}"

  # Public IP
  ip_id = scaleway_instance_ip.nomad_consul_client_ip[count.index].id

  # SG
  security_group_id = scaleway_instance_security_group.default.id
}

resource "scaleway_instance_ip" "nomad_consul_client_ip" {
    count = 1
}
