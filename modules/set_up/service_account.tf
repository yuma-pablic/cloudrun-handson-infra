resource "google_service_account" "cnsrun_app_cloud_build" {
  account_id   = "cnsrun-cloudbuild"
  display_name = "Service Account for Cloud Build in cnsrun"
}

resource "google_project_iam_member" "cloud_build_artifact_registry" {
  member  = google_service_account.cnsrun_app_cloud_build.member
  project = var.project_id
  role    = "roles/artifactregistry.writer"
}

resource "google_project_iam_member" "cloud_build_logs_writer" {
  member  = google_service_account.cnsrun_app_cloud_build.member
  project = var.project_id
  role    = "roles/logging.logWriter"
}

resource "google_service_account" "cnsrun_app_cloud_deploy" {
  account_id   = "cnsrun-clouddeploy"
  display_name = "Service Account for Cloud Deploy in cnsrun"
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
  account_id   = "cnsrun-app-frontend"
  display_name = "Service Account for Service Account for cnsrun-frontend"
}

resource "google_cloud_run_service_iam_member" "frontend_invoke_backend" {
  service  = "cnsrun-backend"
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
  account_id   = "cnsrun-app-backend"
  display_name = "Service Account for Service Account for cnsrun-frontend"
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
  account_id   = "cnsrun-app-batch"
  display_name = "Service Account for cnsrun-app-batch"
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
  secret_id = "cnsrun-app-db-password"
  member    = google_service_account.cnsrun_app_batch.member
  role      = "roles/secretmanager.secretAccessor"
}

resource "google_service_account" "neg" {
  account_id   = "cnsrun-app-neg"
  display_name = "Service Account for Cloud Build in cnsrun"
}

resource "google_cloud_run_service_iam_member" "neg_invoker" {
  service  = "cnsrun-frontend"
  location = "asia-northeast1"
  role     = "roles/run.invoker"
  member   = google_service_account.neg.member
}
