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