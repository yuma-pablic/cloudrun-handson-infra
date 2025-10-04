resource "google_compute_forwarding_rule" "cnsrun-lb" {
  name                  = "cnsrun-lb"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  ip_addres             = cnsrun-ip
  port_range            = "443"
}
