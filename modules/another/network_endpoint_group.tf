resource "google_compute_region_network_endpoint_group" "function_neg" {
  name                  = "cnsrun-app-neg-asia-northeast1"
  network_endpoint_type = "SERVERLESS"
  region                = "asia-northeast1"
  cloud_run {
    service = "cnsrun-frontend"
  }
}
