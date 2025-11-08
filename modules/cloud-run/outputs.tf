output "service_account_email" {
  value       = google_service_account.this.email
  description = "Service account email"
}

output "service_account_member" {
  value       = google_service_account.this.member
  description = "Service account member"
}

output "service_account_id" {
  value       = google_service_account.this.account_id
  description = "Service account ID"
}
