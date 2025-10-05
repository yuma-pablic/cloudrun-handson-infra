resource "google_compute_url_map" "urlmap" {
  name            = "cnsrun-urlmaps"
  default_service = google_compute_backend_service.default.id
}
