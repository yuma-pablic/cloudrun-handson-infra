resource "google_compute_ssl_certificate" "default" {
  name_prefix = "cnsrun-certificate"
  private_key = file("path/to/private.key")
  certificate = file("path/to/certificate.crt")

  lifecycle {
    create_before_destroy = true
  }
}
