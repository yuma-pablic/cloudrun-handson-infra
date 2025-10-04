resource "google_compute_backend_service" "default" {
  name                  = "cnsrun-backend-services"
  load_balancing_scheme = "EXTERNAL_MANAGED"

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      locality_lb_policies
    ]
  }

  backend {
    group = google_compute_region_network_endpoint_group.function_neg.id
  }
}