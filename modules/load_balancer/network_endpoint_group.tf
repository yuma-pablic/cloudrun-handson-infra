resource "google_compute_region_network_endpoint_group" "function_neg" {
  name                  = local.neg_name
  network_endpoint_type = "SERVERLESS"
  region                = "asia-northeast1"
  cloud_run {
    service = local.frontend_service
  }
}
