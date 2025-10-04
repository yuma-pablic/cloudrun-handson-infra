resource "google_compute_backend_service" "default" {
  name                  = "cnsrun-backend-services"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL"
}

resource "google_compute_network_endpoint_group" "cnsrun_app_neg" {
  name                  = "cnsrun-app-neg-asia-northeast1"
  network               = "default"
  subnetwork            = "default"
  default_port          = 80
  region                = "asia-northeast1"
  network_endpoint_type = "SERVERLESS"
}

