output "nomad_ip" {
  value = scaleway_instance_server.nomad_consul_master[0].public_ip
}
