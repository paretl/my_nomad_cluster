terraform {
  required_providers {
    nomad = {
      source = "hashicorp/nomad"
      version = "1.4.14"
    }
  }
  required_version = ">= 0.15"
}

# Configure the Nomad provider
provider "nomad" {
  address = "http://${var.nomad_ip}:4646"
}
