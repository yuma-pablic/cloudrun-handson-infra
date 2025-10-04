resource "google_compute_ssl_certificate" "default" {
  name_prefix = "cnsrun-certificate"
  private_key = file("${path.root}/private.key")
  certificate = file("${path.root}/cnsrun.crt")

  lifecycle {
    create_before_destroy = true
  }
}
