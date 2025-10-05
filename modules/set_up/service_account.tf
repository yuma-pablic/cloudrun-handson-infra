resource "google_service_account" "cnsrun_app_cloud_build" {
  account_id   = "cnsrun-app-cloud-build"
  display_name = "Service Account for Cloud Build in cnsrun"
}

resource "google_service_account" "cnsrun_app_cloud_deploy" {
  account_id   = "cnsrun-app-cloud-deploy"
  display_name = "Service Account for Cloud Deploy in cnsrun"
}