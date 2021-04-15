resource "local_file" "ansible_inventory" {
  content         = templatefile(format("%s/templates/hosts", path.module), local.inventory)
  filename        = format("%s/inventory.yaml", path.module)
  file_permission = "0644"
}

locals {
  server_types = [
    {
      name  = "masters",
      value = scaleway_instance_server.nomad_consul_master.*
    },
    {
      name  = "clients",
      value = scaleway_instance_server.nomad_consul_client.*
    }
  ]

  inventory = merge(
    {
      for server_type in local.server_types :
      server_type.name => {
        for server in server_type.value :
        server.name => {
          host        = server.public_ip
          internal_ip = server.private_ip,
        }
      }
    }
  )
}
