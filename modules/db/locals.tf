locals {
  instance_name      = "${var.app_name}-app-instance"
  database_name      = var.app_name
  db_password_secret = "${var.app_name}-app-db-password"
}
