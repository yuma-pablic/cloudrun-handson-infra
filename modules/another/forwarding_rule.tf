resource "google_compute_global_forwarding_rule" "cnsrun-lb" {
  name                  = "cnsrun-lb"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  ip_address            = google_compute_global_address.default.address
  port_range            = "443"
  target                = google_compute_target_https_proxy.default.id
}
