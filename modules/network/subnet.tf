resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name                     = "cnsrun-cloudrun-hands-on-473403"
  ip_cidr_range            = "10.0.0.0/24"
  region                   = var.region
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
}
