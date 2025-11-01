data "google_kms_crypto_key_version" "key_version" {
  count      = var.create_binary_auth ? 1 : 0
  crypto_key = google_kms_crypto_key.attestor_key[0].id
}

resource "google_container_analysis_note" "attestor_note" {
  count   = var.create_binary_auth ? 1 : 0
  name    = var.note_id
  project = var.project_id

  attestation_authority {
    hint {
      human_readable_name = var.note_description
    }
  }
}

resource "google_binary_authorization_attestor" "attestor" {
  count   = var.create_binary_auth ? 1 : 0
  name    = var.attestor_name
  project = var.project_id

  attestation_authority_note {
    note_reference = google_container_analysis_note.attestor_note[0].name
    public_keys {
      id = data.google_kms_crypto_key_version.key_version[0].id
      pkix_public_key {
        public_key_pem      = data.google_kms_crypto_key_version.key_version[0].public_key[0].pem
        signature_algorithm = data.google_kms_crypto_key_version.key_version[0].public_key[0].algorithm
      }
    }
  }
}
