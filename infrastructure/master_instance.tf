
resource "scaleway_instance_server" "nomad_consul_master" {
  type  = "STARDUST1-S"
  image = "centos_8"
  name  = "nomad_consul_master_1"

  # Public IP
  ip_id = scaleway_instance_ip.nomad_consul_master_ip.id

  # SG
  security_group_id = scaleway_instance_security_group.default.id
}

resource "scaleway_instance_ip" "nomad_consul_master_ip" {}
