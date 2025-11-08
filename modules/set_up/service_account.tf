resource "google_service_account" "cnsrun_app_cloud_deploy" {
  account_id   = local.cloud_deploy_sa_id
  display_name = "Service Account for Cloud Deploy in ${var.app_name}"
}
