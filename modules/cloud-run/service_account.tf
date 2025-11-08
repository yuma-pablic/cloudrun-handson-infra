resource "google_service_account" "this" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name != "" ? var.service_account_display_name : "Service Account ${var.service_account_id}"
}
