output "workload_identity_provider" {
  description = "Workload Identity Provider の完全な名前"
  value       = google_iam_workload_identity_pool_provider.main.name
}

output "terraform_service_account_email" {
  description = "Terraform 用サービスアカウントのメールアドレス"
  value       = google_service_account.terraform.email
}

output "deploy_service_account_email" {
  description = "アプリケーションデプロイ用サービスアカウントのメールアドレス"
  value       = google_service_account.deploy.email
}
