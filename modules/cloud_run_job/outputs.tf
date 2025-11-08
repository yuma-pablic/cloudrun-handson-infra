output "batch_service_account_email" {
  description = "Batch job service account email"
  value       = google_service_account.cnsrun_app_batch.email
}

output "batch_service_account_member" {
  description = "Batch job service account member"
  value       = google_service_account.cnsrun_app_batch.member
}
