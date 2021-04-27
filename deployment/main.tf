
terraform {
  backend "remote" {
    organization = "paretl"

    workspaces {
      name = "my_nomad_applications"
    }
  }
}

resource "nomad_job" "prometheus" {
  jobspec = file("${path.module}/prometheus/prometheus.hcl")
}

resource "nomad_job" "fabio" {
  jobspec = file("${path.module}/fabio/fabio.hcl")
}

resource "nomad_job" "webserver" {
  jobspec = file("${path.module}/webserver/webserver.hcl")
}

resource "nomad_job" "alertmanager" {
  jobspec = file("${path.module}/alertmanager/alertmanager.hcl")
}
