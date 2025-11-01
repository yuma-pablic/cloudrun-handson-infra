# Cloud Deploy outputs
output "deploy_target_name" {
  description = "The name of the Cloud Deploy target"
  value       = google_clouddeploy_target.app.name
}

output "deploy_target_id" {
  description = "The ID of the Cloud Deploy target"
  value       = google_clouddeploy_target.app.id
}

# KMS outputs
output "keyring_id" {
  description = "The ID of the KMS key ring"
  value       = var.create_kms ? google_kms_key_ring.keyring[0].id : null
}

output "keyring_name" {
  description = "The name of the KMS key ring"
  value       = var.create_kms ? google_kms_key_ring.keyring[0].name : null
}

output "crypto_key_id" {
  description = "The ID of the KMS crypto key"
  value       = var.create_kms ? google_kms_crypto_key.attestor_key[0].id : null
}

output "crypto_key_name" {
  description = "The name of the KMS crypto key"
  value       = var.create_kms ? google_kms_crypto_key.attestor_key[0].name : null
}

# Binary Authorization outputs
output "attestor_name" {
  description = "The name of the Binary Authorization attestor"
  value       = var.create_binary_auth ? google_binary_authorization_attestor.attestor[0].name : null
}

output "attestor_id" {
  description = "The ID of the Binary Authorization attestor"
  value       = var.create_binary_auth ? google_binary_authorization_attestor.attestor[0].id : null
}

output "note_name" {
  description = "The name of the Container Analysis note"
  value       = var.create_binary_auth ? google_container_analysis_note.attestor_note[0].name : null
}

output "note_id" {
  description = "The ID of the Container Analysis note"
  value       = var.create_binary_auth ? google_container_analysis_note.attestor_note[0].id : null
}
