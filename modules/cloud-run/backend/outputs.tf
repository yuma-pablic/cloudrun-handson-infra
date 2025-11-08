output "service_account_email" {
  value       = google_service_account.backend.email
  description = "Backend service account email"
}

output "service_account_member" {
  value       = google_service_account.backend.member
  description = "Backend service account member"
}
