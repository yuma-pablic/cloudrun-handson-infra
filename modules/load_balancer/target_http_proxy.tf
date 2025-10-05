resource "google_compute_target_https_proxy" "default" {
  name             = "cnsrun-https-proxies"
  url_map          = google_compute_url_map.urlmap.id
  ssl_certificates = [google_compute_ssl_certificate.default.id]
}
