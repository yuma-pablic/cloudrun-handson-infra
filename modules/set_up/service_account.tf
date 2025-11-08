resource "google_service_account" "cnsrun_app_cloud_deploy" {
  account_id   = local.cloud_deploy_sa_id
  display_name = "Service Account for Cloud Deploy in ${var.app_name}"
}

resource "google_project_iam_member" "cloud_deploy_artifact_registry" {
  member  = google_service_account.cnsrun_app_cloud_deploy.member
  project = var.project_id
  role    = "roles/artifactregistry.reader"
}

resource "google_project_iam_member" "cloud_deploy_run_developer" {
  member  = google_service_account.cnsrun_app_cloud_deploy.member
  project = var.project_id
  role    = "roles/run.developer"
}

resource "google_project_iam_member" "cloud_deploy_service_account_user" {
  member  = google_service_account.cnsrun_app_cloud_deploy.member
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
}

resource "google_service_account" "cnsrun_app_frontend" {
  account_id   = local.frontend_sa_id
  display_name = "Service Account for Service Account for ${local.frontend_service_name}"
}

resource "google_cloud_run_service_iam_member" "frontend_invoke_backend" {
  service  = local.backend_service_name
  location = "asia-northeast1"
  role     = "roles/run.invoker"
  member   = google_service_account.cnsrun_app_frontend.member
}

resource "google_project_iam_member" "frontend_artifact_registry_reader" {
  member  = google_service_account.cnsrun_app_frontend.member
  project = var.project_id
  role    = "roles/artifactregistry.reader"
}

resource "google_service_account" "cnsrun_app_backend" {
  account_id   = local.backend_sa_id
  display_name = "Service Account for Service Account for ${local.backend_service_name}"
}

resource "google_project_iam_member" "backend_artifact_registry_reader" {
  member  = google_service_account.cnsrun_app_backend.member
  project = var.project_id
  role    = "roles/artifactregistry.reader"
}

resource "google_project_iam_member" "cnsrun_app_db_password" {
  member  = google_service_account.cnsrun_app_backend.member
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
}

resource "google_project_iam_member" "cnsrun_app_db" {
  member  = google_service_account.cnsrun_app_backend.member
  project = var.project_id
  role    = "roles/cloudsql.client"
}

resource "google_service_account" "cnsrun_app_batch" {
  account_id   = local.batch_sa_id
  display_name = "Service Account for ${var.app_name}-app-batch"
}

resource "google_project_iam_member" "batch_run_invoker" {
  member  = google_service_account.cnsrun_app_batch.member
  project = var.project_id
  role    = "roles/run.invoker"
}

resource "google_project_iam_member" "batch_cloudsql_client" {
  member  = google_service_account.cnsrun_app_batch.member
  project = var.project_id
  role    = "roles/cloudsql.client"
}

resource "google_secret_manager_secret_iam_member" "batch_db_password" {
  secret_id = local.db_password_secret
  member    = google_service_account.cnsrun_app_batch.member
  role      = "roles/secretmanager.secretAccessor"
}

resource "google_service_account" "neg" {
  account_id   = local.neg_sa_id
  display_name = "Service Account for Cloud Build in ${var.app_name}"
}

resource "google_cloud_run_service_iam_member" "neg_invoker" {
  service  = local.frontend_service_name
  location = "asia-northeast1"
  role     = "roles/run.invoker"
  member   = google_service_account.neg.member
}
