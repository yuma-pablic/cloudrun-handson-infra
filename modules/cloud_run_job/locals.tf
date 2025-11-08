locals {
  # Service account names
  batch_sa_id = "${var.app_name}-app-batch"

  # Secret names
  db_password_secret = "${var.app_name}-app-db-password"
}
