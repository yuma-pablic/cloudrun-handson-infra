resource "google_compute_ssl_certificate" "default" {
  name_prefix = local.certificate_prefix
  private_key = tls_private_key.alb.private_key_pem
  certificate = tls_self_signed_cert.alb.cert_pem

  lifecycle {
    create_before_destroy = true
  }
}

resource "tls_private_key" "alb" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "alb" {
  private_key_pem = tls_private_key.alb.private_key_pem
  subject {
    country             = "JP"
    province            = "Kanagawa"
    locality            = "Yokohama"
    organization        = "uma-arai"
    organizational_unit = "Container"
    common_name         = "team.bit.uma.arai@gmail.com"
  }
  validity_period_hours = 87600
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth"
  ]
}