resource "google_cloud_run_service_iam_member" "invoke_backend" {
  service  = var.backend_service_name
  location = var.location
  role     = "roles/run.invoker"
  member   = google_service_account.frontend.member
}

resource "google_project_iam_member" "artifact_registry_reader" {
  member  = google_service_account.frontend.member
  project = var.project_id
  role    = "roles/artifactregistry.reader"
}

resource "google_cloud_run_service_iam_member" "neg_invoker" {
  service  = var.frontend_service_name
  location = var.location
  role     = "roles/run.invoker"
  member   = google_service_account.neg.member
}
