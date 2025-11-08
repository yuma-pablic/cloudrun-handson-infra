resource "google_service_account" "backend" {
  account_id   = "${var.app_name}-app-backend"
  display_name = "Service Account for ${var.app_name}-backend"
}
