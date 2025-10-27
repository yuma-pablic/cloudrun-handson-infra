resource "google_compute_target_https_proxy" "default" {
  name             = "cnsrun-https-proxies"
  url_map          = google_compute_url_map.urlmap.id
  ssl_certificates = [google_compute_ssl_certificate.default.id]
  ssl_policy       = google_compute_ssl_policy.nonprod-ssl-policy.id
}

resource "google_compute_ssl_policy" "nonprod-ssl-policy" {
  name            = "cnsrun-ssl-policy"
  profile         = "RESTRICTED"
  min_tls_version = "TLS_1_2"
}
