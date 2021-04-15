terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "paretl"

    workspaces {
      name = "my_nomad_cluster"
    }
  }
}
