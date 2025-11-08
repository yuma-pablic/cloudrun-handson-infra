output "service_account_email" {
  value       = google_service_account.frontend.email
  description = "Frontend service account email"
}

output "service_account_member" {
  value       = google_service_account.frontend.member
  description = "Frontend service account member"
}

output "neg_service_account_email" {
  value       = google_service_account.neg.email
  description = "NEG service account email"
}

output "neg_service_account_member" {
  value       = google_service_account.neg.member
  description = "NEG service account member"
}
