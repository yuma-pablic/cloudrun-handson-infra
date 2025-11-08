resource "google_compute_url_map" "urlmap" {
  name            = local.url_map_name
  default_service = google_compute_backend_service.default.id
}
