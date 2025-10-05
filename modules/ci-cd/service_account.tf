resource "google_service_account" "cnsrun_app_frontend" {
  account_id   = "cnsrun-app-frontend"
  display_name = "Service Account for cnsrun-frontend"
}

resource "google_service_account" "cnsrun_app_backend" {
  account_id   = "cnsrun-app-backend"
  display_name = "Service Account for cnsrun-backend"
}

