resource "google_service_account" "frontend" {
  account_id   = "${var.app_name}-app-frontend"
  display_name = "Service Account for ${var.app_name}-frontend"
}

resource "google_service_account" "neg" {
  account_id   = "${var.app_name}-app-neg"
  display_name = "Service Account for NEG in ${var.app_name}"
}
