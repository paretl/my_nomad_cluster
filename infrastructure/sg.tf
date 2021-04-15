
resource "scaleway_instance_security_group" "default" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = "22"
    ip     = "109.26.56.8"
  }

  outbound_rule {
    action   = "accept"
    ip_range = "0.0.0.0/0"
  }
}
