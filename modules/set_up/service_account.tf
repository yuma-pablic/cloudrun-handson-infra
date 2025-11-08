resource "google_service_account" "cnsrun_app_cloud_deploy" {
  account_id   = local.cloud_deploy_sa_id
  display_name = "Service Account for Cloud Deploy in ${var.app_name}"
}

resource "google_service_account" "cnsrun_app_frontend" {
  account_id   = local.frontend_sa_id
  display_name = "Service Account for Service Account for ${local.frontend_service_name}"
}
resource "google_service_account" "cnsrun_app_backend" {
  account_id   = local.backend_sa_id
  display_name = "Service Account for Service Account for ${local.backend_service_name}"
}

resource "google_service_account" "cnsrun_app_batch" {
  account_id   = local.batch_sa_id
  display_name = "Service Account for ${var.app_name}-app-batch"
}
resource "google_service_account" "neg" {
  account_id   = local.neg_sa_id
  display_name = "Service Account for Cloud Build in ${var.app_name}"
}
