locals {
  # Service account names
  cloud_deploy_sa_id = "${var.app_name}-clouddeploy"
  frontend_sa_id     = "${var.app_name}-app-frontend"
  backend_sa_id      = "${var.app_name}-app-backend"
  batch_sa_id        = "${var.app_name}-app-batch"
  neg_sa_id          = "${var.app_name}-app-neg"

  # Service names
  backend_service_name  = "${var.app_name}-backend"
  frontend_service_name = "${var.app_name}-frontend"

  # Secret names
  db_password_secret = "${var.app_name}-app-db-password"

  # Artifact Registry
  repository_id = "${var.app_name}-app"
}
