resource "google_compute_network" "vpc" {
  name                    = "cnsrun-app"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  mtu                     = 1460
}
