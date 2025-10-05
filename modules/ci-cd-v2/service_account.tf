resource "google_service_account" "app" {
  account_id   = "cnsrun-app-${var.app}"
  display_name = "Service Account for cnsrun-${var.app}"
}