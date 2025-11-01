resource "google_kms_key_ring" "keyring" {
  count    = var.create_kms ? 1 : 0
  name     = var.keyring_name
  location = var.region
}

resource "google_kms_crypto_key" "attestor_key" {
  count    = var.create_kms ? 1 : 0
  name     = var.key_name
  key_ring = google_kms_key_ring.keyring[0].id
  purpose  = "ASYMMETRIC_SIGN"

  version_template {
    algorithm = "EC_SIGN_P256_SHA256"
  }

  lifecycle {
    prevent_destroy = false
  }
}
