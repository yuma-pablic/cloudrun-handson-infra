resource "google_service_account" "cnsrun_app_batch" {
  account_id   = local.batch_sa_id
  display_name = "Service Account for ${var.app_name}-app-batch"
}
